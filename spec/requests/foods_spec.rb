require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'Get /foods' do
    before(:each) do
      get foods_path
    end

    it 'returns a 302 response' do
      expect(response).to have_http_status '302'
    end

    it 'redirects to sign in page' do
      expect(response).to redirect_to new_user_session_path
    end
  end
end