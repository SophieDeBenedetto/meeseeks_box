class SearchesController < ApplicationController
  def new
    @search = SearchForm.new
  end

  def create
    @scene  = Search.for(search_params)
  end

  private

  def search_params
    params.require(:search_form).permit(:season, :episode, :keyword, :random)
  end
end