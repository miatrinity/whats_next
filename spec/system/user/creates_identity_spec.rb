# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User creates identity', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'successfully' do
    login_as create(:user)
    visit root_path

    click_on 'New'

    fill_in 'identity[name]', with: "I'm a great dev"
    attach_file 'identity[avatar]', Rails.root.join('spec', 'fixtures', 'identity.png')

    click_on 'Create Identity'

    expect(page).to have_text('Identity was successfully created.')
    expect(page).to have_text("I'm a great dev")
    expect(page).to have_css('img[src*=identity]', count: 1)
    expect(page).to have_css('#identity-count', count: 1, text: '1')
  end
end
