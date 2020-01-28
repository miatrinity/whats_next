# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User edits facets', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'successfully' do
    facet = create(:facet)

    login_as facet.identity.user

    visit identity_facets_path(facet.identity)

    click_on 'Edit'

    fill_in 'facet[name]', with: "I'm an edited facet"
    attach_file 'facet[avatar]', Rails.root.join('spec', 'fixtures', 'edited_facet.png')

    click_on 'Update Facet'

    expect(page).to have_text('Facet was successfully updated.')
    expect(page).to have_text("I'm an edited facet")
    expect(page).to have_css('img[src*=edited_facet]', count: 1)
  end
end
