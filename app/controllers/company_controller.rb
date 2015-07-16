class CompanyController < ApplicationController
  def index
    @companies = Company.order(:created_at)
  
    respond_to do |format|
      format.html
      format.csv { send_data @companies.as_csv }
    end
  end
end
