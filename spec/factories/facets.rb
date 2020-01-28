# frozen_string_literal: true

FactoryBot.define do
  factory :facet do
    name { 'Factory in yo Face' }
    sequence(:identity) { association(:identity) }

    before(:create) do |facet|
      facet.avatar.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'facet.png')),
        filename: 'facet.png', content_type: 'image/png'
      )
    end
  end
end
