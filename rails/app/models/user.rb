# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  # 新規登録時の認証操作のため:confimrmableを有効
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  # 1対多, userが削除されたら子も削除
  has_many :articles, dependent: :destroy
end
