require 'stripe'
class SubscribeController < ApplicationController
  def new
    unless (params[:plan_name] == "basic" || params[:plan_name] == "advanced" || params[:plan_name] == "standard")
      flash[:notice] = "Please select a plan to get started."
      redirect_to pricing_path  
    end
  end
  def update
    debugger
    token = params[:stripeToken]
    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => token,
    plan: params[:id]
  )
    redirect_to root_path, notice: "Thank You For Your Support"
  end
end
