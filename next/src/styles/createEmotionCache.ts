// キャッシュ関連の共通処理を記載するファイル
import createCache, { EmotionCache } from '@emotion/cache'

export default function createEmotionCache(): EmotionCache {
  return createCache({ key: 'css' })
}
