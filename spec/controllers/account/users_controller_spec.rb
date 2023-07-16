require 'rails_helper'

RSpec.describe Account::UsersController, type: :controller do
  login_user

  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: { slug: current_user.slug }

      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end
end
