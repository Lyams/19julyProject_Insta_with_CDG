require 'rails_helper'

RSpec.describe Follow, type: :model do
  subject { build(:follow) }

  describe 'attributes' do
    it { is_expected.to respond_to(:follower_id) }
    it { is_expected.to respond_to(:following_id) }
  end

  describe 'association' do
    it { is_expected.to belong_to :follower }
    it { is_expected.to belong_to :following }
  end
  # it { is_expected.to validate_uniqueness_of(:following).scoped_to(:follower).with_message('subscribe should happen once') }
  describe 'validations' do
    it 'follower should be present' do
      subject.follower_id = nil
      is_expected.to_not be_valid
    end
    it 'following should be present' do
      subject.following_id = nil
      is_expected.to_not be_valid
    end
    it 'follow only once' do
      subject
      is_expected.to_not be_valid
    end
  end
end
