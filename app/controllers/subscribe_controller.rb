require 'stripe'
class SubscribeController < ApplicationController
  def new
    unless (params[:plan_name] == "window" || params[:plan_name] == "world" || params[:plan_name] == "business")
      flash[:notice] = "Please select a plan to get started."
      redirect_to root_path
    end
  end

  def update
    token = params[:stripeToken]
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: token,
      plan: params[:id],
      description: 'Windows Of Worlds'
    )
    if (params[:promo] != 'none') && params[:promo]
      redirect_to new_shipping_path(email: customer.email, promo: params[:promo], paid: true), notice: "Thank You For Your Support"
    # elsif params[:promo] == 'band'
    #   redirect_to new_promo_path(paid: true), notice: "Thank You For Your Support"
    # elsif params[:promo] == 'business'
    #   redirect_to new_biz_promo_path(paid: true), notice: "Thank You For Your Support"
    else
      redirect_to root_path, notice: "Thanks for supporting"
    end
  end
end