class AncestriesController < ApplicationController
  def index
    @ancestries = Ancestry.all
  end

  # def show
  #   @ancestry = Nation.find(params[:id])
  # end
end