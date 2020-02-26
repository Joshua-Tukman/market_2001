class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new {|hash, item| hash[item] = 0}
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    total_dollar = 0
    @inventory.map do |item, amount|
      total_dollar += item.price * amount      
    end
    total_dollar
  end
end
