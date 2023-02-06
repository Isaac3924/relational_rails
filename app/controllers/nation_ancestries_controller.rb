class NationAncestriesController < ApplicationController
  def index
    @nation = Nation.find(params[:nation_id])
    @ancestries = @nation.ancestries
  end

  def new
    @nation = Nation.find(params[:nation_id])
  end

  def create
    nation = Nation.find(params[:nation_id])
    ancestry = Ancestry.create(nation_params)
    redirect_to "/nations/#{nation.id}/ancestries"
  end

private
  def nation_params
    params.permit(:name, :landlocked, :population, :national_language)
  end
end