# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Identity, type: :model do
  describe '#name' do
    it { should validate_presence_of(:name) }
  end

  describe '#avatar' do
    subject { create(:identity, :with_avatar).avatar }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
