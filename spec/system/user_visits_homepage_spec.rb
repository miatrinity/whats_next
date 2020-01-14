require 'rails_helper'

RSpec.describe "User Visits Homepage", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "successfully" do
    visit root_path

    expect(page).to have_text("Welcome to what's next")
  end
end
