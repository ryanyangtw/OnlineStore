class EmailWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(order_id , condition)
		@order = Order.find(order_id)
		case condition
			when "after_placing_order"
				OrderMailer.notify_order_placed(@order).deliver
			when "after_paying_with_credit_card"
				OrderMailer.notify_after_payment(@order).deliver
				OrderMailer.notify_seller_after_payment(@order).deliver
			when "after_placing_order_sending_email_to_seller"
				OrderMailer.notify_seller_after_order_placed(@order).deliver
			when "after_product_is_shipping_sending_email_to_buyer"
				OrderMailer.notify_buyer_when_product_is_shipping(@order).deliver
			when "after_product_is_shipped_sending_email_to_buyer"
				OrderMailer.notify_buyer_when_product_is_shipped(@order).deliver
		end
		
	end

end