# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User cancels identity creation', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'successfully' do
    login_as create(:user)
    visit new_identity_path

    click_on 'Cancel'

    expect(page).to have_current_path(identities_path)
  end
end
