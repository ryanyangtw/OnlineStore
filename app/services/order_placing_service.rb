class OrderPlacingService
	def initialize(cart,order)
		@order = order
		@cart = cart
	end

	def place_order!
		@order.build_item_cache_from_cart(@cart)
		@order.calculate_total!(@cart)
		@order.update_columns(seller_id: @order.items.first.seller.id)

		EmailWorker.perform_async(@order.id, 'after_placing_order')
		EmailWorker.perform_async(@order.id, 'after_placing_order_sending_email_to_seller')
		#OrderMailer.notify_order_placed(@order).deliver
	end
end