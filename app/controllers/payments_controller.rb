class PaymentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@user = current_user
		token = params[:stripeToken]
		#create the charge on STripe's servers - this will charge the user's card
		begin
			charge = Stripe::Charge.create(
				amount: (@product.price * 100), #amount in cents, again
				currency: "usd",
				source: token,
				description: params[:stripeEmail],
				)
		if charge.paid
			Order.create(product_id: @product_id, user_id: @user_id, total: @product_price)
		end

		rescue Stripe::CardError => e
			#the card has been declined
			body = e.json_body
    	err = body[:error]
    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
		end
	redirect_to product_path(@product), notice: "Payment was processed successfully"
	end
end