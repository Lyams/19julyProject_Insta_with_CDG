require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) {create :user}
  let!(:post) {create :post}
  subject { build(:comment, user_id: user.id, post_id: post.id) }

  it { should respond_to(:user_id) }
  it { should respond_to(:post_id) }
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :post }
  it { is_expected.to be_valid }

  it "user should be present" do
    subject.user_id = nil
    is_expected.to be_invalid
  end
  it "post should be present" do
    subject.post_id = nil
    is_expected.to be_invalid
  end
end