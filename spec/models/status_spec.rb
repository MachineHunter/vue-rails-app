require 'rails_helper'

RSpec.describe Status, type: :model do
  let(:status) { create(:status) }

  describe 'データ整合性チェック' do
    it '負の場合はじく' do
      status.enhancement = -10
      expect(status.save).not_to eq true
    end

    it 'ユーザーと結び付いているか' do
      expect(status.user_id).not_to eq nil
    end
  end
end
