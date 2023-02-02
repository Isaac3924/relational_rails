class NationAncestriesController < ApplicationController
  def index
    nation = Nation.find(params[:nation_id])
    @ancestries = nation.ancestries
  end
end