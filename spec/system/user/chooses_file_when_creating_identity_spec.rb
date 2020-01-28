# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User chooses file when creating identity', type: :system do
  it 'filename shows up' do
    login_as create(:user)

    visit new_identity_path

    attach_file 'identity[avatar]',
                Rails.root.join('spec', 'fixtures', 'identity.png'),
                make_visible: true

    expect(page).to have_css('#identity_avatar ~ .file-name', text: 'identity.png', count: 1)
  end
end
