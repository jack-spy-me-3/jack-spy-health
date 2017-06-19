class SearchesController < ApplicationController

  def index
    @borough = params[:borough]
    @search_results = HealthCenter.where(borough: params[:borough])
  end
end
