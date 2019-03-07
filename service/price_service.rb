class PriceService

  def total_price(items)
     i = 0.0
     items.each do |item|
     i += item.price * item.quantity
     end
     i * 100
  end
end
