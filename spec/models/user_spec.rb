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
  it { is_expected.to have_many :followings }
  it { is_expected.to have_many :followers }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_length_of(:email).is_at_least(5) }
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
