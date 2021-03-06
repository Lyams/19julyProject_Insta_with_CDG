require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user2) { create(:second_user) }
  let!(:post) { create(:post) }

  context "sign in user" do
    before { sign_in user2 }

    describe '#create' do
      let(:params) { { comment: { commentary: "It is a greek", post_id: post.id, user_id: user2.id } } }
      subject { process :create, method: :post, params: params }

      it 'create comment' do
        expect { subject }.to change { Comment.count }.by(1)
        is_expected.to redirect_to user_post_path(post.user, post)
      end

      # it 'permit' do
      #   should permit(:commentary, :post_id, :user_id).for(:create, params: params).on(:comment)
      # end
    end
  end

  context "sign out user" do
    before { sign_out user2 }

    describe '#create' do
      let(:params) { { comment: { commentary: "It is a greek", post_id: post.id, user_id: user2.id } } }
      subject { process :create, params: params }

      it 'do not create comment' do
        expect { subject }.to_not change { Comment.count }
        is_expected.to redirect_to new_user_session_path
      end
    end
  end
end
