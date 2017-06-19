class SearchesController < ApplicationController

  def index
    @borough = params[:borough]
    if params[:search] && params[:search].downcase.include?("health") && params[:search].downcase.include?("center")
      @search_results = HealthCenter.where(borough: params[:borough])
    end
  end
end
