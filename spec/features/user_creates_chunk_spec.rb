require 'rails_helper'
require 'pry'

feature 'User creates a chunk' do
  title = 'testy-test-'.concat(rand(10).to_s)
  duration = 25

  scenario 'Successful persistance' do
    chunk = Chunk.new(user_id: 4, title: title, duration: duration)
    chunk.save!
    persisted_chunk = Chunk.find_by(title: title)

    expect(persisted_chunk).to eq(chunk)

    persisted_chunk.destroy
  end

  scenario 'Successful display of new chunk and removal of new chunk form' do
    user = User.find(4)
    sign_in user
    visit root_path
    fill_in('title', with: title)
    fill_in('duration', with: duration)
    click_button('Create Chunk')

    expect(page).to have_css 'div', text: title
    expect(page).to have_no_button('Create Chunk')
  end
end
