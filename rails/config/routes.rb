Rails.application.routes.draw do
  # letter_opener_web 用のルーティングを定義
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  namespace :api do
    namespace :v1 do
      get "health_check", to: "health_check#index"
      # User に対するルーティングをapi/v1配下へ
      mount_devise_token_auth_for "User", at: "auth"

      # サインインユーザーの情報を取得するアクション
      namespace :current do
        resource :user, only: [:show]
      end
      resources :articles, only: [:show]
    end
  end
end
