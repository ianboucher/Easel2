class RefundsController < ApplicationController

  def create
    # binding.pry
    @purchase = Purchase.find(params[:purchase_id])
    Stripe::Refund.create(charge: @purchase.charge_id)
    @purchase.update(refunded: true)

    flash[:notice] = "Your refund has been issued"
    redirect_to root_path

  rescue Stripe::InvalidRequestError => e
     flash[:alert] = e.message
     redirect_to root_path
  end
end
