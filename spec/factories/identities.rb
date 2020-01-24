# frozen_string_literal: true

FactoryBot.define do
  factory :identity do
    name { "I'm a kick-ass factory boy" }
    sequence(:user) { association(:user) }

    before(:create) do |identity|
      identity.avatar.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'identity.png')),
        filename: 'identity.png', content_type: 'image/png'
      )
    end
  end
end
