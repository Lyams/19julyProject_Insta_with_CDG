require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user2) { create(:second_user) }
  let!(:post) { create(:post, user: user) }
  let!(:params) { { user_id: user2.id, id: post.id } }
  subject { process :create, params: params}

  context "sign in user" do
    before { sign_in user2 }
    describe '#create' do
      context 'not like' do
        it 'create like' do
          expect {subject}.to change {Like.count}.by(1)
        end
        context 'params invalid' do
          let!(:params) { { user_id: user2.id, id: nil } }
          it { expect {subject}.to raise_error ActiveRecord::RecordNotFound}
        end
      end
      context 'has like' do
        it 'do not create like' do
          subject
          expect {subject}.not_to change {Like.count}
        end
      end
    end
    describe '#destroy' do
      subject { process :destroy, method: :delete, params: params }
      context 'has like' do
        let!(:like) { create( :like, user_id: user2.id, post_id: post.id) }
        it 'destroy like' do
          expect {subject}.to change {Like.count}.by(-1)
        end
      end
      context 'not like' do
        it 'do not destroy like' do
          expect {subject}.to_not change {Like.count}
        end
      end
    end
  end

  context "sign out user" do
    before { sign_out user2 }
    describe '#create' do
      it 'do not create like' do
        expect {subject}.to change {Like.count}.by(0)
      end
      it { is_expected.to redirect_to  new_user_session_path }
    end
    describe '#destroy' do
      let!(:like) { create( :like, user_id: user2.id, post_id: post.id) }
      subject { process :destroy, method: :delete, params: params }
      it 'do not destroy like' do
        expect {subject}.to change {Like.count}.by(0)
      end
      it { is_expected.to redirect_to  new_user_session_path }
    end
  end
end