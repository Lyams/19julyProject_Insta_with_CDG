require "rails_helper"

RSpec.describe "Users", :type => :request do
  it 'root page' do
    get '/'
    expect(response).to render_template(:index)
  end
end