class PaymentsController < ApplicationController
  # POST /payments
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price*100).to_i,
        :currency => "eur",
        :source => token,
        :description => "Example charge"
      )
      if charge.paid
        Order.create(product_id: @product.id, user_id: current_user.id, total: @product.price)
        logger.debug "Payment successful: #{@product.id}"
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      logger.debug "Payment failed: #{err[:message]}"
    end
    flash[:notice] = "Thanks for your purchase"
    redirect_to product_path(@product)
  end
end
