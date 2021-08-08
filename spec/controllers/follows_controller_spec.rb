require 'rails_helper'

RSpec.describe FollowsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user2) { create(:second_user) }
  let!(:params) { { following_id: user2.id, id: user } }
  subject { process :create, params: params }
  before { sign_in user }

  describe '#create' do
    it 'create following' do
      expect { subject }.to change { Follow.count }.by(1)
    end
    context 'already following' do
      it 'no create another similar following' do
        subject
        expect { subject }.to_not change { Follow.count }
      end
    end
  end

  describe '#destroy' do
    subject { process :destroy, method: :delete, params: params }
    context 'has following' do
      let!(:follow) { create(:follow, follower: user, following: user2) }
      it 'destroy following' do
        expect { subject }.to change { Follow.count }.by(-1)
      end
    end
    context 'has not following' do
      it 'nothing to destroy ' do
        expect { subject }.to_not change { Follow.count }
      end
    end
  end

  context 'sign out user' do
    before { sign_out user }

    describe '#create' do
      it 'create following' do
        expect { subject }.to change { Follow.count }.by(0)
      end
      it { is_expected.to redirect_to new_user_session_path }
    end
    describe '#destroy' do
      subject { process :destroy, method: :delete, params: params }

      it { is_expected.to redirect_to new_user_session_path }
      context 'has following' do
        let!(:follow) { create(:follow, follower: user, following: user2) }
        it 'destroy following' do
          expect { subject }.to_not change { Follow.count }
        end
      end
      context 'has not following' do
        it 'nothing to destroy ' do
          expect { subject }.to_not change { Follow.count }
        end
      end
    end
  end
end
