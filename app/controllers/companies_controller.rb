class CompaniesController < ApplicationController
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to thanks_path
    else
      render "new"
    end
  end

end
