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

  def update
    ancestry = Ancestry.find(params[:id])
    ancestry.update(ancestry_params)
    redirect_to "/ancestries/#{ancestry.id}"
  end

  def destroy
    ancestry = Ancestry.find(params[:id])
    ancestry.destroy
    redirect_to "/ancestries"
  end

private
  def ancestry_params
    params.permit(:name, :darkvision, :population, :patron_deity, :nation_id)
  end
end