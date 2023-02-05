class NationsController < ApplicationController
  def index
    @nations = Nation.all
    @nations.order(created_at: :asc)
  end

  def show
    @nation = Nation.find(params[:id])
    @ancestries_count = @nation.ancestries.count
  end
end