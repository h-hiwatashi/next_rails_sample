class Api::V1::Current::UsersController < Api::V1::BaseController
  # show アクションが実行される前にリクエストヘッダーの認証情報の検証
  before_action :authenticate_user!

  def show
    render json: current_user, serializer: CurrentUserSerializer
  end
end
