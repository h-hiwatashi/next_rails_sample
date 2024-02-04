class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # deviseからSessionへのアクセスを回避
  include DeviseHackFakeSession
end
