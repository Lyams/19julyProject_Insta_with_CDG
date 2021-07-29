require 'rails_helper'

RSpec.describe Post, type: :model do
  #let(:user) {create(:user)}
  subject { build(:post) }

  it { should respond_to(:description) }

  it "valid attributes" do
    expect(subject).to be_valid
  end

  it "description should be present" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  #it "image-data should be present" do
  #  e = build(:post, image_data = nil)
  #  expect(e).to_not be_valid
  #end

  it "user_id should be present" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "description should not be blanc" do
    subject.description = ""
    expect(subject).to_not be_valid
  end

end
