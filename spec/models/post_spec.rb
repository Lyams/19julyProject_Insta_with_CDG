require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  describe 'attributes' do
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:image_data) }
    it { is_expected.to respond_to(:title) }
  end

  describe 'association' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:description).is_at_least(2) }
    it { is_expected.to validate_length_of(:title).is_at_least(1).is_at_most(25) }
    it { is_expected.to be_valid }
    it 'description should be present' do
      subject.description = nil
      is_expected.to_not be_valid
    end
    it 'image-data should be present' do
      expect(build(:post, image_data: nil)).to_not be_valid
    end
    it 'user_id should be present' do
      subject.user = nil
      expect(subject).to be_invalid
    end
    it 'description should not be blanc' do
      subject.description = ''
      expect(subject).to_not be_valid
    end
    it 'not image = not valid' do
      expect(build(:post_invalid_image)).to be_invalid
    end
  end
end
