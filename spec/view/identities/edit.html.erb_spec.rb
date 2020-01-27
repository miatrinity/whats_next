# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "identities/new", :type => :view do
  it "avatar file-name is displayed if avatar is attached" do
    assign(:identity, create(:identity))
    render
    expect(rendered).to match(/identity.png/)
  end

end