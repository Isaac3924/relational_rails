class AncestriesController < ApplicationController
  def index
    @ancestries = Ancestry.all
  end

  def show
    @ancestry = Ancestry.find(params[:id])
  end

  def edit
    @ancestry = Ancestry.find(params[:id])
  end
end