class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2
  
  attr_reader :title
  attr_accessor :price_code
  
  def price_code=(value)
    @price_code = value
    @price = case price_code
    when REGULAR: RegularPrice.new
    when NEW_RELEASE: NewReleasePrice.new
    when CHILDRENS: ChildrensPrice.new
    end
  end
  
  def initialize(title, the_price_code)
    @title, self.price_code = title, the_price_code
  end
  
  def charge(days_rented)
    result = 0
    case price_code
      when REGULAR
        result += 2
        result += (days_rented - 2) * 1.5 if days_rented > 2
      when NEW_RELEASE
        result += days_rented * 3
      when CHILDRENS
        result += 1.5
        result += (days_rented - 3) * 1.5 if days_rented > 3
    end
    result
  end
  
  def frequent_renter_points(days_rented)
    (price_code == NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end

class RegularPrice
  
end

class NewReleasePrice
  
end

class ChildrensPrice
  
end

