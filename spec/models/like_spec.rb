require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { build(:like) }

  it { should respond_to(:user_id) }
  it { should respond_to(:post_id) }
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :post }

end