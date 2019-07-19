require "rails_helper"

feature 'User visits landing page' do
  scenario 'Successful' do
    visit root_path

    expect(page).to have_css 'h1', text: 'Chunk Master'
  end
end

