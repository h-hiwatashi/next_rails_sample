import { Box, Grid, Container, Pagination } from '@mui/material'
import camelcaseKeys from 'camelcase-keys'
// Next.js のページコンポーネントの型定義
import type { NextPage } from 'next'
import Link from 'next/link'
// ページ遷移を行う関数
import { useRouter } from 'next/router'
import useSWR from 'swr'
import ArticleCard from '@/components/ArticleCard'
import Error from '@/components/Error'
import Loading from '@/components/Loading'
import { styles } from '@/styles'
import { fetcher } from '@/utils'

type ArticleProps = {
  id: number
  title: string
  createdAt: string
  fromToday: string
  user: {
    name: string
  }
}
// 記事一覧ページ
const Index: NextPage = () => {
  const router = useRouter()
  const page = 'page' in router.query ? Number(router.query.page) : 1
  const url = process.env.NEXT_PUBLIC_API_BASE_URL + '/articles/?page=' + page

  /*
    useSWRのGET
    RailsAPI からの articls レコードの取得
    useSWR を使用するために、
    import useSWR from 'swr'とimport { fetcher } from '@/utils'が必要
  */
  const { data, error } = useSWR(url, fetcher)
  if (error) return <div>An error has occurred.</div>
  if (error) return <Error />
  if (!data) return <Loading />

  // キャメルケースになったJSONとしてarticlesに格納
  const articles = camelcaseKeys(data.articles)
  const meta = camelcaseKeys(data.meta)

  // クリックされたページ番号をvalueとして受け取り、その値をクエリーパラメーターpageに含めて上で、記事一覧ページ（/）に遷移
  const handleChange = (event: React.ChangeEvent<unknown>, value: number) => {
    router.push('/?page=' + value)
  }

  return (
    // MUI
    <Box css={styles.pageMinHeight} sx={{ backgroundColor: '#e6f2ff' }}>
      {/* maxWidthプロパティにブレイクポイントを指定 */}
      {/* sx={{ pt: 6 }}は、padding-top: '48px' */}
      {/* <Conatiner>要素の最大幅をmd(=900px) */}
      <Container maxWidth="md" sx={{ pt: 6 }}>
        <Grid container spacing={4}>
          {articles.map((article: ArticleProps, i: number) => (
            <Grid key={i} item xs={12} md={6}>
              {/* 配下のJSXにリンクを付与 */}
              <Link href={'/articles/' + article.id}>
                <ArticleCard
                  title={article.title}
                  fromToday={article.fromToday}
                  userName={article.user.name}
                />
              </Link>
            </Grid>
          ))}
        </Grid>{' '}
        <Box sx={{ display: 'flex', justifyContent: 'center', py: 6 }}>
          <Pagination
            count={meta.totalPages}
            page={meta.currentPage}
            onChange={handleChange}
          />
        </Box>
      </Container>
    </Box>
  )
}

export default Index
