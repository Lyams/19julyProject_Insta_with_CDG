require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { build(:comment) }

  it { should respond_to(:user_id) }
  it { should respond_to(:post_id) }
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :post }

end