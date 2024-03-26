class Api::V1::Current::ArticlesController < Api::V1::BaseController
  # 認証済みユーザーからのリクエストのみを受け付ける
  # 当コントローラーで実装するアクションは「サインインユーザーが自身のマイ記事に対する操作」を行うものを想定しているので、
  # before_actionでアクション全体に定義
  before_action :authenticate_user!

  def index
    # 未保存ステータスを除いたマイ記事を取得
    articles = current_user.articles.not_unsaved.order(created_at: :desc)
    render json: articles
  end

  def create
    # 未保存ステータスがない場合は新規作成
    unsaved_article = current_user.articles.unsaved.first || current_user.articles.create!(status: :unsaved)
    render json: unsaved_article
  end

  def update
    article = current_user.articles.find(params[:id])
    article.update!(article_params)
    render json: article
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :status)
    end
end
