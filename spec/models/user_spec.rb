require 'rails_helper'

RSpec.describe User, type: :model do
  subject {build(:user)}
  it { should respond_to(:email) }
  it { should respond_to(:bio) }
  it { should respond_to(:name) }
  it { should respond_to(:encrypted_password) }
  it { is_expected.to have_many :posts }
  it { is_expected.to have_many :likes }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many(:follower_follows).with_foreign_key(:following_id).class_name("Follow") }
  it { is_expected.to have_many(:following_follows).with_foreign_key(:follower_id).class_name("Follow") }
  it { is_expected.to have_many(:followings).through(:following_follows).source(:following) }
  it { is_expected.to have_many(:followers).through(:follower_follows).source(:follower) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(5) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity}
  it { is_expected.to be_valid }

  it "name should be present" do
    subject.name = nil
    is_expected.to_not be_valid
  end

  it "email should be present" do
    subject.email = nil
    is_expected.to_not be_valid
  end

end
