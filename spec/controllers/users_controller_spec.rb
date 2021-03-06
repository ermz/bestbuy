require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in @user
      end

      it 'loads correct user' do
        get :show, params: { id: @user.id }
        expect(assigns(:user)).to eq @user
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a different user tries to view another user' do
      before do
        sign_in @user2
      end

      it 'redirects to root path' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(root_path)
      end
    end

  end
end
