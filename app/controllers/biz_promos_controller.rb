class BizPromosController < ApplicationController
  before_filter :authenticate_user!, except: [:new, :create]
  before_action :set_biz_promo, only: [:show, :edit, :update, :destroy]

  # GET /biz_promos
  # GET /biz_promos.json
  def index
    @biz_promos = BizPromo.all
  end

  # GET /biz_promos/1
  # GET /biz_promos/1.json
  def show
  end

  # GET /biz_promos/new
  def new
    unless !params[:paid].nil?
      flash[:error] = "Please make a payment to recieve a shirt"
      redirect_to root_path
    end
    @biz_promo = BizPromo.new
  end

  # GET /biz_promos/1/edit
  def edit
  end

  # POST /biz_promos
  # POST /biz_promos.json
  def create
    @biz_promo = BizPromo.new(biz_promo_params)
    if @biz_promo.save
      redirect_to root_path, notice: 'We will promote you!'
    else
      render :new
    end
  end

  # PATCH/PUT /biz_promos/1
  # PATCH/PUT /biz_promos/1.json
  def update
    respond_to do |format|
      if @biz_promo.update(biz_promo_params)
        format.html { redirect_to @biz_promo, notice: 'Biz promo was successfully updated.' }
        format.json { render :show, status: :ok, location: @biz_promo }
      else
        format.html { render :edit }
        format.json { render json: @biz_promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biz_promos/1
  # DELETE /biz_promos/1.json
  def destroy
    @biz_promo.destroy
    respond_to do |format|
      format.html { redirect_to biz_promos_url, notice: 'Biz promo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biz_promo
      @biz_promo = BizPromo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biz_promo_params
      params.require(:biz_promo).permit(:logo, :business_name, :twitter_handle, :website_url, :facebook_url, :instagram_handle)
    end
end
