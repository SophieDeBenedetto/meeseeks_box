class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @scene  = Search.for(search_params)
  end

  private

  def search_params
    params.require(:search).permit(:season, :episode, :keyword)
  end
end