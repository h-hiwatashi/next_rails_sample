import { Box } from '@mui/material'
import { marked } from 'marked'
import 'zenn-content-css'

type MarkdownTextProps = {
  content: string
}

const MarkdownText = (props: MarkdownTextProps) => {
  return (
    <Box
      // zenn-content-cssを適用
      className="znc"
      //   h1~h3のスタイルを微調整するcssを独自に適用
      sx={{
        h1: { fontWeight: 'bold' },
        h2: { fontWeight: 'bold' },
        h3: { fontWeight: 'bold' },
      }}
    >
      {/* markdownテキストをHTMLに展開 */}
      <div dangerouslySetInnerHTML={{ __html: marked(props.content) }} />
    </Box>
  )
}

export default MarkdownText
