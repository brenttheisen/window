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
    debugger
    token = params[:stripeToken]
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: token,
      plan: params[:id],
      description: 'Windows Of Worlds'
    )
    if !params[:promo].nil?
      if customer.subscriptions.data[0].plan.id == '8734002' || customer.subscriptions.data[0].plan.id == '349867578729'
        redirect_to new_shipping_path(email: customer.email, promo: !params[:promo].nil?), notice: "Thank You For Your Support"
      else
        redirect_to new_promo_path, notice: "Thank You For Your Support"
      end
    else
      redirect_to root_path, notice: "Thanks for supporting"
    end
    # Stripe::Transfer.create(
    #   :amount => (Stripe::Plan.retrieve(params[:id]).amount * 15)/100,
    #   :currency => "usd",
    #   :recipient => 'rp_168eeSKsa3SDdBb0cxu6BvLW',
    #   :description => "Transfer for Fred 15%"
    # )
  end
end



# Stripe::Customer.retrieve(customer.id).subscriptions.all().data[0].plan.statement_descriptor