require 'rails_helper'

RSpec.describe FollowersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user2) { create(:second_user) }
  let!(:post) { create(:post, user: user) }
  let!(:follow) { create(:follow, follower: user2, following: user ) }
  let!(:params) { { user_id: user2.id } }
  subject { get :index, params: params }

  context "sign in user" do
    before { sign_in user2 }

    describe '#index' do

      it 'assigns @posts' do
        subject
        expect(assigns(:posts)).to eq([post])
      end
    end
  end
end