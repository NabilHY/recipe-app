require 'rails_helper'

RSpec.describe 'Recipe_foods', type: :request do
  describe 'Get foods#index' do
    before(:each) do
      get foods_path
    end

    it 'to be redirected' do
      expect(response).to have_http_status '302'
    end

    it 'to redirect to sign in page' do
      expect(response).to redirect_to new_user_session_path
    end
  end
end
