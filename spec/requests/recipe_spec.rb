require 'rails_helper'

RSpec.describe 'Recipe', type: :request do
  describe 'Get /recipes' do
    before(:each) do
      # user = User.create name: 'user', email: 'user@example.com', password: 'password'
      # post user_session_path, params: { user: { email: user.email, password: user.password } }
      get recipes_path
    end

    it 'returns a 302 response' do
      expect(response).to have_http_status '302'
    end

    it 'redirects to sign in page' do
      expect(response).to redirect_to new_user_session_path
    end
  end
end