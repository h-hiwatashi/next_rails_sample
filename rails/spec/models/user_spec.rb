require "rails_helper"

RSpec.describe User, type: :model do
  context "factoryのデフォルト設定に従った場合" do
    let(:user) { create(:user) } # users レコードを作成

    it "認証済みの user レコードを正常に新規作成できる" do
      # バリデーションエラーがないこと
      expect(user).to be_valid
      expect(user).to be_confirmed
    end
  end
end
