class Api::V1::ArticlesController < Api::V1::BaseController
  # concern モジュールを読み込みMIみ
  include Pagination

  def index
    # includesは関連先のテーブルのレコードをキャッシュとして取得するメソッド
    articles = Article.published.order(created_at: :desc).page(params[:page] || 1).per(10).includes(:user)
    render json: articles, meta: pagination(articles), adapter: :json
  end

  def show
    # Article.publishedで公開中の記事から検索
    article = Article.published.find(params[:id])
    render json: article
  end
end
