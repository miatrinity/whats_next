# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User attaches avatar to identity: ', type: :system do
  it 'filename is displayed' do
    login_as create(:user)
    visit root_path

    click_on 'New'

    attach_file 'identity[avatar]',
                Rails.root.join('spec', 'fixtures', 'identity.png'),
                make_visible: true

    expect(page).to have_css('#identity_avatar ~ .file-name', text: 'identity.png', count: 1)
  end
end
