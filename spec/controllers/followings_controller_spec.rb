require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user2) { create(:second_user) }
  let!(:follow) { create(:follow, follower: user, following: user2) }
  let!(:params) { { user_id: user.id } }
  subject { get :index, params: params }

  context 'sign in user' do
    before { sign_in user }
    describe '#index' do
      it 'assigns @followings' do
        subject
        expect(assigns(:followings)).to eq([follow.following])
      end
    end
  end
  context 'sign out user' do
    before { sign_out user }
    describe '#index' do
      it 'assigns @followings' do
        subject
        expect(assigns(:followings)).to eq(nil)
        is_expected.to redirect_to new_user_session_path
      end
    end
  end
end
