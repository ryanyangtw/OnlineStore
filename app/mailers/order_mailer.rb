class OrderMailer < ActionMailer::Base
  default from: "sevice@onlinestore.com"

  def notify_order_placed(order)
    
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info
    mail(:to => @user.email , :subject => " [Online Store] 感謝您完成本次的下單，以下是您這次購物明細 #{order.token}")
  end


  def notify_after_payment(order)
  	@order = order
  	@user = order.user
  	@order_items = @order.items
    @order_info = @order.info

  	mail(:to => @user.email , :subject => " [Online Store] 您已付款成功，您的訂單編號為： #{order.token}")
  end

  def notify_seller_after_payment(order)
    @order = order
    @user = order.seller
    @order_items = @order.items
    @order_info = @order.info

    mail(:to => @user.email , :subject => " [Online Store] 已收到買家付款，請立即出貨，您的訂單編號為：： #{order.token}")
  end


  def notify_seller_after_order_placed(order)
    @order = order
    @user = order.seller
    @order_items = @order.items
    @order_info = @order.info
    mail(:to => @user.email , :subject => " [Online Store] 您有一筆新的訂單，訂單編號: #{order.token}")
  end


  def notify_buyer_when_product_is_shipping(order)
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info
    mail(:to => @user.email , :subject => " [Online Store] 您的訂單已出貨，訂單編號: #{order.token}")
  end


  def notify_buyer_when_product_is_shipped(order)
    @order = order
    @user = order.user
    @order_items = @order.items
    @order_info = @order.info
    mail(:to => @user.email , :subject => " [Online Store] 商品已到貨，訂單編號: #{order.token}")
  end

end