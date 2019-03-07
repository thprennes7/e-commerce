module OrderDetailsHelper
  def find_details(order)
    return a = OrderDetail.where(order_id: order.id)
  end
end
