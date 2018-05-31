require 'rails_helper'

RSpec.describe "sessions/sign_in.html.erb", type: :view do
  
  describe "GET '/sign_in' - from API", :type => :feature do
    it 'shows, Welcome To Swish It!' do
      visit('http://localhost:3000/sign_in')
      expect(page).to have_content("Welcome To Swish It!")
      puts 'cool, swishing~!'
    end
  end

  feature 'Visitor signs in' do
    before :each do
      User.create(email: "user@example.com", password: '1234', first_name: "first", last_name: "last", username: "fuck", birthday: "12-12-2010", remember_token: SecureRandom.hex(10))
    end

  scenario 'with valid email and password' do
    sign_in_with("user@example.com", "1234")

    expect(page).to have_content('All Tasks')
  end

  scenario 'with invalid email' do
    sign_in_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_in_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end

  def sign_in_with(email, password)
    visit sign_in_path
    fill_in 'session_sign_in', with: email
    fill_in 'session_password', with: password
    click_on 'Sign In!'
  end
end
end
