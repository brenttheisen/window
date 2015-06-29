class ShippingsController < ApplicationController
  before_action :set_shipping, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :create]

  # GET /shippings
  # GET /shippings.json
  def index
    @shippings = Shipping.all
  end

  # GET /shippings/1
  # GET /shippings/1.json
  def show
  end

  # GET /shippings/new
  def new
    unless params[:paid]
      flash[:error] = "Please make a payment to recieve a shirt"
      redirect_to root_path
    end
    @email = params[:email]
    @shipping = Shipping.new
    @promo = params[:promo]
  end

  # GET /shippings/1/edit
  def edit
  end

  # POST /shippings
  # POST /shippings.json
  def create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
      if params[:shipping][:promo] == 'band'
        redirect_to new_promo_path(paid: true), notice: "Enter your details to be promoted"
      elsif params[:shipping][:promo] == 'business'
        redirect_to new_biz_promo_path(paid: true), notice: "Enter your details to be promoted"
      else
        redirect_to root_path, notice: 'Shipping info was successfully saved.'
      end
    else
       render :new
       render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shippings/1
  # PATCH/PUT /shippings/1.json
  def update
    if @shipping.update(shipping_params)
       redirect_to @shipping, notice: 'Shipping was successfully updated.'
       render :show, status: :ok, location: @shipping
    else
       render :edit
       render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shippings/1
  # DELETE /shippings/1.json
  def destroy
    @shipping.destroy
     redirect_to shippings_url, notice: 'Shipping was successfully destroyed.'
     head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping
      @shipping = Shipping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipping_params
      params.require(:shipping).permit(:email, :address, :name, :phone)
    end
end
