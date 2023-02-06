class NationsController < ApplicationController
  def index
    @nations = Nation.all
    @nations.order(created_at: :asc)
  end

  def show
    @nation = Nation.find(params[:id])
    @ancestries_count = @nation.ancestries.count
  end

  def new
  end

  def create
    nation = Nation.create(nation_params)
    redirect_to "/nations"
  end
  
  def edit

  end

  def nation_params
    params.permit(:name, :landlocked, :population, :national_language)
  end

end