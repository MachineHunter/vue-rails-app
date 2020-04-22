require 'rails_helper'

RSpec.describe Status, type: :model do
  let(:status) { create(:status) }

  describe 'データ整合性チェック' do
    it '正か' do
      expect(status.imagination).to be >= 0
      expect(status.humor).to be >= 0
      expect(status.automation).to be >= 0
      expect(status.enhancement).to be >= 0
    end

    it 'ユーザーと結び付いているか' do
      expect(status.user_id).not_to eq nil
    end
  end

end
