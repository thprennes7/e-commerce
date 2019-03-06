class Price_service

  def total_price(items)
     i = 0
     items.each do |item| 
     i += item.price
     end
  end
end
