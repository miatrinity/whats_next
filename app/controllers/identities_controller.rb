# frozen_string_literal: true

# :nodoc:
class IdentitiesController < ApplicationController
  before_action :authenticate_user!

  def index
  end
end
