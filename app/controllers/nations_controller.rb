class NationsController < ApplicationController
  def index
    @nations = Nation.all
  end

  def show
    @nation = Nation.find(params[:id])
  end
end