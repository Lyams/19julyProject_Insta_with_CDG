require 'rails_helper'

RSpec.describe Follow, type: :model do
  subject { build(:follow) }

  it { should respond_to(:follower_id) }
  it { should respond_to(:following_id) }
  it { is_expected.to belong_to :follower }
  it { is_expected.to belong_to :following }
  it "follower should be present" do
    subject.follower_id = nil
    is_expected.to_not be_valid
  end
  it "following should be present" do
    subject.following_id = nil
    is_expected.to_not be_valid
  end
  it 'follow only once' do
    subject
    is_expected.to_not be_valid
  end
end