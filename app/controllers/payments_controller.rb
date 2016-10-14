class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    logger.debug "XXXXXXX"
    logger.debug "Usuario: #{@user.first_name} y producto: #{@product.name}"
    logger.debug "XXXXXXX"
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price*100).to_i, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail] #,
        # :receipt_email => params[:stripeEmail]
      )
    logger.debug "XXXXXXX"
    logger.debug "Precio: #{:amount} y descripcion: #{:description}"
    logger.debug "XXXXXXX"
    if charge.paid
      Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
  end
end
