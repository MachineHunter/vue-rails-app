require 'rails_helper'

RSpec.describe Avatar, type: :model do
  let(:avatar) { create(:avatar) }

  describe 'データ整合性チェック' do
    it '正しくfactoryで作られてるか' do
      expect(avatar.filename).to eq "white.jpeg"
    end

    it 'ユーザーと結び付いているか' do
      expect(avatar.user_id).not_to eq nil
    end
  end
end
