class Replace_Temp_with_Query
  
  def initialize(quantity, price)
    @quantity = quantity
    @item_price = price
  end
    

  def price
    a_base_price = base_price
    if a_base_price >1000
      discount_factor = 0.95
    else
      discount_factor = 0.98
    end
    a_base_price * discount_factor
  end
  
  def base_price
    @quantity * @item_price
  end
end
