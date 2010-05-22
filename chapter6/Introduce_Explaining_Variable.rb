
class Introduce_Explaining_Variable
  def initialize(quantity, item_price)
    @quantity = quantity
    @item_price = item_price
  end
  
  def price
    # 価格は、基本価格 - 数量割引 + 配送料
    return @quantity * @item_price -
    [0, @quantity - 500].max * @item_price * 0.05 +
    [@quantity * @item_price * 0.1,100.0].min
  end
end
