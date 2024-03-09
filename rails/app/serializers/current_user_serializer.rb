# レスポンスボディーを制御する
class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
