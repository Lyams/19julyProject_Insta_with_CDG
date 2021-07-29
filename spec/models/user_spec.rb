require 'rails_helper'

RSpec.describe User, type: :model do
  subject {build(:user)}
  it { should respond_to(:email) }
  it { should respond_to(:bio) }
  it { should respond_to(:name) }
end
