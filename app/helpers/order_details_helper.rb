module OrderDetailsHelper
  def find_details(order)
    OrderDetail.where(order_id: order.id)
  end
end
