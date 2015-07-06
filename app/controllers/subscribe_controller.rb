require 'stripe'
class SubscribeController < ApplicationController
  def new
    unless (params[:plan_name] == "window" || params[:plan_name] == "world" || params[:plan_name] == "star" || params[:plan_name] == 'window_paid' || params[:plan_name] == 'world_paid' || params[:plan_name] == 'star_paid')
      flash[:error] = "Please select a plan to get started."
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
    redirect_to new_shipping_path(email: customer.email, promo: params[:promo], paid: true), notice: "Thank You For Your Support"
  end
end