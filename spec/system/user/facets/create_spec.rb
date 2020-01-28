# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User creates facet', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'successfully' do
    identity = create(:identity)
    login_as identity.user
    visit root_path

    click_on identity.name
    click_on 'New'

    fill_in 'facet[name]', with: 'JS'
    attach_file 'facet[avatar]', Rails.root.join('spec', 'fixtures', 'facet.png')

    click_on 'Create Facet'

    expect(page).to have_text('Facet was successfully created.')
    expect(page).to have_text('JS')
    expect(page).to have_css('img[src*=facet]', count: 1)
    expect(page).to have_css('#facet-count', text: '1')
  end
end
