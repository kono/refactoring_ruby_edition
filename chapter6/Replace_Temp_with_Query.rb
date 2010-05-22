class Replace_Temp_with_Query
  
  def initialize(quantity, price)
    @quantity = quantity
    @item_price = price
  end
    

  def price
    base_price * discount_factor
  end
  
  def base_price
    @quantity * @item_price
  end
  
  def discount_factor
    base_price > 1000 ? 0.95 : 0.98
  end
end
