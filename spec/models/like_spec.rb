require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { build(:like) }

  describe 'attributes' do
    it { should respond_to(:user_id) }
    it { should respond_to(:post_id) }
  end

  describe 'association' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :post }
  end

  describe 'validations' do
    it { is_expected.to be_valid }
    it 'user should be present' do
      subject.user = nil
      is_expected.to_not be_valid
    end
    it 'post should be present' do
      subject.post = nil
      expect(subject).to be_invalid
    end
  end
end
