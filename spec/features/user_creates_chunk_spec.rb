require 'rails_helper'
require 'pry'

feature 'User creates a chunk' do
  title = "testy-test-".concat(rand(10).to_s)

  scenario 'Successful persistance' do
    chunk = Chunk.new(user_id: 1, title: title, duration: 25)
    chunk.save!
    persisted_chunk = Chunk.find_by(title: title)

    expect(persisted_chunk).to eq(chunk)

    persisted_chunk.destroy
  end

  scenario 'Successful display of new chunk' do
    binding.pry
    user = User.find(1)
    sign_in user
    fill_in('testy-title', with: title)
    fill_in('duration', with: 25)
    click_button('Create Chunk')

    expect(page).to have_css 'div', text: title
  end
end
