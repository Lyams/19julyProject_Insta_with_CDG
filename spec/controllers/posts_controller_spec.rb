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

    describe '#new' do
      subject { get :new, params: params}
      it { is_expected.to render_template :new}
      it 'assigns new post' do
        subject
        expect(assigns(:post)).to be_a_new Post
      end
    end

    describe '#create' do
      let!(:params) { {post: attributes_for(:post), user_id: user.id} }
      subject { post :create, params: params }

      it 'create post' do
        expect {subject}.to change {Post.count}.by(1)
        is_expected.to redirect_to user_post_path(assigns(:user), assigns(:post ))
      end

      it 'permit' do
        should permit(:description, :image, :user_id).for(:create, params: params).on(:post)
      end

      context 'when params invalid' do
        let(:params) { { user_id: user.id, post: { description: nil}} }
        it { is_expected.to render_template :new }
        it { expect { subject }.not_to change { Post.count } }
      end
    end

    describe '#edit' do
      let!(:post) {create :post, user: user}
      let(:params) { { id: post, user_id: user} }
      subject { process :edit, method: :get, params: params}

      it { is_expected.to render_template :edit }
      it 'assigns server policy' do
        subject
        expect(assigns :post).to eq post
      end
    end

    describe '#destroy' do
      let!(:post) {create :post, user: user}
      let(:params) { { id: post, user_id: user} }
      subject { process :destroy, method: :delete, params: params}

      it 'destroys record' do
        expect {subject}.to change {Post.count}.by(-1)
        is_expected.to redirect_to(user_posts_path(assigns :user))
      end
    end

    describe '#update' do
      let!(:post) {create :post, user: user}
      let(:params) { { id: post, user_id: user, post: { description: 'New decription! ;)'} } }
      subject { process :update, method: :put, params: params }

      it { is_expected.to redirect_to(user_post_path(assigns(:user), assigns(:post)))}
      it 'updates post' do
        expect { subject }.to change { post.reload.description }.to('New decription! ;)')
      end

      context 'with bad params' do
        let(:params) { { id: post, user_id: user, post: { description: ''}} }

        it 'does not update post' do
          expect { subject }.not_to change { post.reload.description}
        end
      end
    end
  end

  context "sign out user" do
    before { sign_out user }

    describe '#new' do
      subject { get :new, params: params}
      it { is_expected.to redirect_to  new_user_session_path }
    end

    describe '#destroy' do
      let!(:post) { create :post, user: user }
      let(:params) { { id: post, user_id: user } }
      subject { process :destroy, method: :delete, params: params }

      it 'destroys record' do
        expect {subject}.not_to change {Post.count}
        is_expected.to redirect_to  new_user_session_path
      end
    end

    describe '#edit' do
      let!(:post) { create :post, user: user }
      let(:params) { { id: post, user_id: user } }
      subject { process :edit, method: :get, params: params }

      it { is_expected.to redirect_to  new_user_session_path }
    end

    describe '#update' do
      let!(:post) { create :post, user: user }
      let(:params) { { id: post, user_id: user, post: { description: 'New decription! ;)'} } }
      subject { process :update, method: :put, params: params }

      it { is_expected.to redirect_to  new_user_session_path}
      it 'updates post' do
        expect { subject }.not_to change { Post.count }
        expect { subject }.not_to change { post.reload.description }
      end
    end

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
      it { is_expected.to render_template(:show) }
      context 'post without user data' do
        let(:params) { { user_id: nil, id: post} }
        it { expect {subject}.to raise_error ActionController::UrlGenerationError }
      end
    end

  end
end