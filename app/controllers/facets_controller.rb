# frozen_string_literal: true

# :nodoc:
class FacetsController < ApplicationController
  before_action :authenticate_user!

  def index
    load_facets
  end

  def new
    load_identity
    @facet = Facet.new
  end

  def create
    build_facet
    save_facet('Facet was successfully created.') or render :new
  end

  def edit
    load_identity
    load_facet
    build_facet
  end

  def update
    load_identity
    load_facet
    build_facet
    save_facet('Facet was successfully updated.') or render :edit
  end

  private

  def load_facets
    @facets ||= facet_scope.to_a
  end

  def load_facet
    @facet ||= facet_scope.find(params[:id])
  end

  def build_facet
    @facet ||= facet_scope.build
    @facet.attributes = facet_params
  end

  def save_facet(notice)
    redirect_to(identity_facets_path(@identity), notice: notice) if @facet.save
  end

  def facet_scope
    load_identity
    @identity.facets
  end

  def load_identity
    @identity ||= identity_scope.find(params[:identity_id])
  end

  def identity_scope
    current_user.identities
  end

  def facet_params
    facet_params = params[:facet]
    facet_params ? facet_params.permit(:name, :avatar) : {}
  end
end
