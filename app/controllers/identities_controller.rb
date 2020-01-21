# frozen_string_literal: true

# :nodoc:
class IdentitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    identities
  end

  def new
    @identity = Identity.new
  end

  def create
    build_identity
    save_identity('Identity was successfully created.') or render :new
  end

  private

  def identities
    @identities ||= identity_scope.to_a
  end

  def build_identity
    @identity ||= identity_scope.build
    @identity.attributes = identity_params
  end

  def save_identity(notice)
    redirect_to(identities_path, notice: notice) if @identity.save
  end

  def identity_scope
    current_user.identities
  end

  def identity_params
    identity_params = params[:identity]
    identity_params ? identity_params.permit(:name, :avatar) : {}
  end
end


