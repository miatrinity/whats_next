# frozen_string_literal: true

# :nodoc:
class Identity < ApplicationRecord
  belongs_to :user
  has_many :facets

  has_one_attached :avatar

  validates_presence_of :name

  validates :avatar, attached: true
end
