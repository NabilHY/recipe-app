require 'rails_helper'

RSpec.describe 'Food', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'user', email: 'example@mail.com', password: 'password') }
  let(:food) { user.foods.create(name: 'Paella', measurment_unit: 'kg', price: 5) }

  describe 'GET /index' do
    before do
      sign_in user
      get foods_path
    end

    it 'should redirect' do
      expect(response).to have_http_status(302)
    end

    it 'should return response status correct' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
