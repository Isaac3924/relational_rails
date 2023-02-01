class SpeciesController < ApplicationController
  def index
    @species = Species.all
  end

  # def show
  #   @species_singular = Nation.find(params[:id])
  # end
end