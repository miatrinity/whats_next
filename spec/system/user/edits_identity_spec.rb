# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User edits identity', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'successfully' do
    user = create(:user)
    create(:identity, user: user)

    login_as user

    visit identities_path

    click_on 'Edit'

    fill_in 'identity[name]', with: "I'm an edited identity"
    attach_file 'identity[avatar]', Rails.root.join('spec', 'fixtures', 'edited_identity.png')

    click_on 'Update Identity'

    expect(page).to have_text('Identity was successfully updated.')
    expect(page).to have_text("I'm an edited identity")
    expect(page).to have_css('img[src*=edited_identity]', count: 1)
  end
end
