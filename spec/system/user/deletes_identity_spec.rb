# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User deletes identity', type: :system do
  it 'successfully' do
    user = create(:user)
    create(:identity, user: user)

    login_as user

    visit identities_path

    accept_confirm do
      click_on 'Delete'
    end

    expect(page).to have_text('Identity was successfully deleted.')
    expect(page).to_not have_css('[id^=identity_]')
    expect(page).to have_css('#identity-count', count: 1, text: '0')
  end
end
