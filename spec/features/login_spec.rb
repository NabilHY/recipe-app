require 'rails_helper'

RSpec.describe 'Login' do
  before(:each) do
    visit new_user_session_path
  end

  it 'redirects to sign in page' do
    expect(page).to have_content 'Log in'
  end

  it 'has the input fields for email and password' do
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
  end

  it 'prevents from logging in if inputs are empty' do
    find('#log_in').click
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
  end

  it 'logs in succesfully' do
    visit root_path
    @user = User.create(name: 'test', email: 'user@example.com', password: 'password')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    find('#log_in').click
    expect(page).to have_current_path(new_user_session_path)
  end
end