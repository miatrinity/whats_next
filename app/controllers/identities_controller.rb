# frozen_string_literal: true

# :nodoc:
class IdentitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    load_identities
  end

  def new
    @identity = Identity.new
  end

  def create
    build_identity
    save_identity('Identity was successfully created.') or render :new
  end

  def edit
    load_identity
    build_identity
  end

  def update
    load_identity
    build_identity
    save_identity('Identity was successfully updated.') or render :edit
  end

  def destroy
    load_identity
    @identity.destroy

    redirect_to identities_path, notice: 'Identity was successfully deleted.'
  end

  private

  def load_identities
    @identities ||= identity_scope.to_a
  end

  def load_identity
    @identity ||= identity_scope.find(params[:id])
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
