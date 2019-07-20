require "rails_helper"

feature 'User visits landing page' do
  scenario 'Successful' do
    visit root_path

    expect(page).to have_css 'h1', text: 'Chunk Master'
  end
end

feature 'User visits sign up page' do
  scenario 'Successful' do
    visit new_user_registration_path

    expect(page).to have_css 'h2', text: 'Sign up'
  end
end

feature 'User visits sign in page' do
  scenario 'Successful' do
    visit user_session_path

    expect(page).to have_css 'h2', text: 'Log in'
  end
end
