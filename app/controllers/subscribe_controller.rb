require 'stripe'
class SubscribeController < ApplicationController
  caches_page :new
  def new
    unless (params[:plan_name] == "window" || params[:plan_name] == "world" || params[:plan_name] == "business")
      flash[:notice] = "Please select a plan to get started."
      redirect_to root_path
    end
  end
  def update
    token = params[:stripeToken]
    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => token,
    plan: params[:id]
  )
    if customer.subscriptions.data[0].plan.id == '8734002' || customer.subscriptions.data[0].plan.id == '349867578729'
      redirect_to new_shipping_path(email: customer.email), notice: "Thank You For Your Support"
    else
      redirect_to root_path, notice: "Thank You For Your Support"
    end
  end
end
