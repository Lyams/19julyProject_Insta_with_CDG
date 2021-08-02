#frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }

  let(:params) { {user_id: user} }

  context "sign in user" do
    before { sign_in user }

    describe '#index' do
      let!(:post) { create(:post, user: user) }
      subject { get :index, params: params }
      it 'assigns @posts' do
        subject
        expect(assigns(:posts)).to eq([post])
      end
      it { is_expected.to render_template('index') }
    end

    describe '#show' do
      let!(:post) { create(:post, user: user) }
      let(:params) { { user_id: post.user_id, id: post} }
      subject { get :show, params: params }
      it 'assigns @post' do
        subject
        expect(assigns(:post)).to eq(post)
      end
      it { is_expected.to render_template(:show)}
      context 'post without user data' do
        let(:params) { { user_id: nil, id: post} }
        it { expect {subject}.to raise_error ActionController::UrlGenerationError}
      end
    end

    describe '#create' do
      let!(:params) { {post: attributes_for(:post), user_id: user.id} }
      subject { post :create, params: params }

      it 'create post' do
        expect {subject}.to change {Post.count}.by(1)
        is_expected.to redirect_to user_post_path(assigns(:user), assigns(:post ))
      end
    end

  end

end