class Api::V1::ArticlesController < Api::V1::BaseController
  def show
    # Article.publishedで公開中の記事から検索
    article = Article.published.find(params[:id])
    render json: article
  end
end
