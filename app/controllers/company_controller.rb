require 'securerandom'
class CompanyController < ApplicationController
  def index
    @companies = Company.all
    respond_to do |format|
      format.html
      format.json {render :json => @companies}
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @address = Address.new(address_params)
    @company.company_id = SecureRandom.uuid
    @company.addresses << @address 
    if @company.save
      redirect_to company_show_path, id:@company.company_id
    else 
      render 'new'
    end
  end

  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @company.as_json.merge(:addresses => @company.addresses.as_json)}
    end
  end

  def edit
    @company = Company.find(params[:id])
    @addresses = @company.addresses
  end

  def update
    @company = Company.find(params[:id])
    comp_update = @company.update(company_params)
    addr_update = []
    @addresses = []
    params[:address].values.each do |address|
      address_find = Address.find(address[:id])
      @addresses << address_find 
      addr_params = ActionController::Parameters.new(address)
      addr_update <<  address_find.update(address_params_permit(addr_params))
    end

    if comp_update && addr_update.all?{|x| x == true}
      redirect_to company_show_path, id:@company.company_id
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      redirect_to company_index_path
    end
  end

  private 
    
    def company_params
      params.require(:company).permit(:name,:domain,:company_type,:description)
    end

    def address_params
      params.require(:address).permit(:building_number,:street_name,:street_address,:secondary_address,:city,:state,:zip_code,:country,:longitude,:latitude)
    end

    def address_params_permit(hash)
      hash.permit(:building_number,:street_name,:street_address,:secondary_address,:city,:state,:zip_code,:country,:longitude,:latitude)
    end


end
