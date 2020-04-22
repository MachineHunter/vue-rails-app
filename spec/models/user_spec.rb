require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe 'データ整合性チェック' do

    context 'email形式' do
      it '@無し' do
        user.email = "testgmail.com"
        expect(user.save).not_to be true
      end

      it '@の左右なし' do
        user.email = "@gmail.com"
        expect(user.save).not_to be true
        user.email = "test@"
        expect(user.save).not_to be true
      end
    end

    context 'アソシエーション' do
      it 'statusを持っているか' do
        expect(user.status).not_to eq nil
      end
    end
  end

end
