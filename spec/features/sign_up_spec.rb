require 'rails_helper'

RSpec.describe Food, type: :feature do
    before(:each) { visit new_user_registration_path }

    describe 'signup page' do
        it 'has the input fields' do
            expect(page).to have_field 'user[name]'
            expect(page).to have_field 'Email'
            expect(page).to have_field 'Password'
            expect(page).to have_field 'Password confirmation'
        end

        it 'prevents from signing up if inputs are empty' do
            find('#sign_up').click
            expect(page).to have_content '3 errors prohibited this user from being saved'
        end

        it 'creates a new user' do
            fill_in 'user[name]', with: 'test'
            fill_in 'user[email]', with: 'example@example.com'
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            find('#sign_up').click
            expect(page).to have_current_path(user_session_path)
        end
    end
end