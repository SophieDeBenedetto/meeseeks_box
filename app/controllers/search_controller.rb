class SearchController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @scene  = Search.for(search_params)
  end

  private

  def search_params
    params[:search]
  end
end