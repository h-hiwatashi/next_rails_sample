class Api::V1::Current::ArticlesController < Api::V1::BaseController
    # 認証済みユーザーからのリクエストのみを受け付ける
    # 当コントローラーで実装するアクションは「サインインユーザーが自身のマイ記事に対する操作」を行うものを想定しているので、
    # before_actionでアクション全体に定義
    before_action :authenticate_user!
  
    def create
      unsaved_article = current_user.articles.unsaved.first || current_user.articles.create!(status: :unsaved)
      render json: unsaved_article
    end
  end