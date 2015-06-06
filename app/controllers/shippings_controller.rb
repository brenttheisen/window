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
    debugger
    @email = params[:email]
    @shipping = Shipping.new
    @promo = !params[:promo].nil?
  end

  # GET /shippings/1/edit
  def edit
  end

  # POST /shippings
  # POST /shippings.json
  def create
    debugger
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
      if params[:shipping][:promo] == 'true'
        redirect_to new_promo_path, notice: "Enter your details to be promoted via twitter"
      else
        format.html { redirect_to root_path, notice: 'Shipping info was successfully saved.' }
        format.json { render :show, status: :created, location: root_path }
      end
    else
      format.html { render :new }
      format.json { render json: @shipping.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /shippings/1
  # PATCH/PUT /shippings/1.json
  def update
    respond_to do |format|
      if @shipping.update(shipping_params)
        format.html { redirect_to @shipping, notice: 'Shipping was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipping }
      else
        format.html { render :edit }
        format.json { render json: @shipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shippings/1
  # DELETE /shippings/1.json
  def destroy
    @shipping.destroy
    respond_to do |format|
      format.html { redirect_to shippings_url, notice: 'Shipping was successfully destroyed.' }
      format.json { head :no_content }
    end
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
