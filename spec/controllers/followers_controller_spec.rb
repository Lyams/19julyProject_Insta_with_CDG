require 'rails_helper'

RSpec.describe FollowersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user2) { create(:second_user) }
  let!(:follow) { create(:follow, follower: user2, following: user ) }
  let!(:params) { { user_id: user.id } }
  subject { get :index, params: params }

  context "sign in user" do
    before { sign_in user }
    describe '#index' do
      it 'assigns @followers' do
        subject
        expect(assigns(:followers)).to eq([follow.follower])
      end
    end
  end
  context "sign out user" do
    before { sign_out user }
    describe '#index' do
      it 'assigns @follower' do
        subject
        expect(assigns(:followers)).to eq(nil)
        is_expected.to redirect_to  new_user_session_path
      end
    end
  end
end