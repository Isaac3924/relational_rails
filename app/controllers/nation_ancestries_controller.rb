class NationAncestriesController < ApplicationController
  def index
    @nation = Nation.find(params[:nation_id])
    @ancestries = @nation.ancestries
  end

  def new
    @nation = Nation.find(params[:nation_id])
  end

  def create
    @nation = Nation.find(params[:nation_id])
    ancestry = Ancestry.create!(ancestry_params)
    redirect_to "/nations/#{@nation.id}/ancestries"
  end

  def alphabetical_index
    @nation = Nation.find(params[:nation_id])
    @ancestries = @nation.ancestries
  end

  def filter
    @nation = Nation.find(params[:nation_id])
    @ancestries = @nation.ancestries.filter_ancestries(params[:input])
    redirect_to "/nations/#{@nation.id}/ancestries"
  end

private
  def nation_params
    params.permit(:name, :landlocked, :population, :national_language)
  end

  def ancestry_params
    params.permit(:name, :darkvision, :population, :patron_deity, :nation_id)
  end
end