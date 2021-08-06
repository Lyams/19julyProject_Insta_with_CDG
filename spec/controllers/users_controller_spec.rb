require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:params) { { id: user.id, bio: user.bio, name: user.name } }

  describe 'index' do
    subject { get :index, params: params }
    it 'assigns @users' do
      subject
      expect(assigns(:users)).to eq([user])
    end
    it { is_expected.to render_template('index') }
  end

  describe 'show' do
    subject { get :show, params: params }
    it 'assigns @user' do
      subject
      expect(assigns(:user)).to eq(user)
    end
    it { is_expected.to render_template('show') }
  end

  describe 'update' do
    let(:params) { { id: user.id, user: {bio: 'I am greek', name: 'Plato2' } } }
    subject { process :update, method: :put, params: params }

    it 'updates users bio' do
      expect { subject }.to change { user.reload.bio }.to('I am greek')
    end
    it 'updates users name' do
      expect { subject }.to change { user.reload.name }.to('Plato2')
    end
    it 'permit' do
      should permit(:bio, :name).for(:update, params: params).on(:user)
    end
  end
end