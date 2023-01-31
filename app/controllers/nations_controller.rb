class NationsController < ApplicationController
  def index
    @nations = Nation.all
  end
end