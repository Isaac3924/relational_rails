class AncestriesController < ApplicationController
  def index
    @ancestries = Ancestries.all
  end

  # def show
  #   @ancestry = Nation.find(params[:id])
  # end
end