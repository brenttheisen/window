class HomeController < ApplicationController
  def index
  end
  def gallery
  end

  def bands
    @bands = Promo.all
  end

  def businesses
    @bizs = BizPromo.all
  end
end
