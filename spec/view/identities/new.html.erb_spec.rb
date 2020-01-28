# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'identities/new', type: :view do
  it "'No file chosen' is displayed if no avatar is attached" do
    assign(:identity, Identity.new)
    render
    expect(rendered).to match(/No file chosen/)
  end
end
