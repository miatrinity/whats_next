# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Identity, type: :model do
  describe '#name' do
    it { should validate_presence_of(:name) }
  end

  describe '#avatar' do
    it { is_expected.to validate_attachment_of(:avatar) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:facets) }
  end
end
