class PromosController < ApplicationController
  before_filter :authenticate_user!, except: [:new, :create]
  before_action :set_promo, only: [:show, :edit, :update, :destroy]

  # GET /promos
  # GET /promos.json
  def index
    @promos = Promo.all
  end

  # GET /promos/1
  # GET /promos/1.json
  def show
  end

  # GET /promos/new
  def new
    unless params[:paid]
      flash[:error] = "Please make a payment to recieve a shirt"
      redirect_to root_path
    end
    @promo = Promo.new
  end

  # GET /promos/1/edit
  def edit
  end

  # POST /promos
  # POST /promos.json
  def create
    @promo = Promo.new(promo_params)
    if @promo.save
      redirect_to "/bands", notice: 'You Should Appear Below!'
    else
      render :new
    end
  end

  # PATCH/PUT /promos/1
  # PATCH/PUT /promos/1.json
  def update
    respond_to do |format|
      if @promo.update(promo_params)
        format.html { redirect_to @promo, notice: 'Promo was successfully updated.' }
        format.json { render :show, status: :ok, location: @promo }
      else
        format.html { render :edit }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promos/1
  # DELETE /promos/1.json
  def destroy
    @promo.destroy
    respond_to do |format|
      format.html { redirect_to promos_url, notice: 'Promo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo
      @promo = Promo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promo_params
      params.require(:promo).permit(:logo, :twitter_handle, :band_name, :youtube_channel, :website_link, :itunes_link, :soundcloud_link, :fb_link, :insta_link)
    end
end
