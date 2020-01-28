# frozen_string_literal: true

# :nodoc:
class Facet < ApplicationRecord
  belongs_to :identity

  has_one_attached :avatar

  validates_presence_of :name

  validates :avatar, attached: true
end
