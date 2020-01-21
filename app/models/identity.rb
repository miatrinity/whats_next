# frozen_string_literal: true

# :nodoc:
class Identity < ApplicationRecord
  validates_presence_of :name

  belongs_to :user

  has_one_attached :avatar
end
