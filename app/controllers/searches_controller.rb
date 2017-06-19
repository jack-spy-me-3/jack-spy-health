class SearchesController < ApplicationController

  def index
    @borough = params[:borough]
    if params[:search] == "general_health"
      @search_results = find_all_center(params[:borough], params[:zip])
    elsif params[:search] == "mental_health"
      @search_results = find_mental_centers(params[:borough], params[:zip])
    end
  end

  private 

  def find_all_center(borough, zip)
    HealthCenter.where(borough: borough).where(zip: zip) + MentalHealth.where(borough: borough).where(zip: zip)
  end

  def find_mental_centers(borough, zip)
    MentalHealth.where(borough: borough).where(zip: zip)
  end
end
