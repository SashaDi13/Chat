require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  describe "GET sign_up" do
    it 'is successful' do
      get new_user_registration_path

      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe "POST sign_up" do
    let!(:user_params) { attributes_for(:user) }

    it 'is successful' do
      expect do
        post user_registration_path, params: { user: user_params }
      end.to change(User, :count).by(1)

      expect(response).to redirect_to(authenticated_root_path(current_user))
      follow_redirect!
      expect(response.body).to include("Welcome! You have signed up successfully.")
    end
  end
end
