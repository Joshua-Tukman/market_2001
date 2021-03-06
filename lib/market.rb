class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map{|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    purveyor = []
    @vendors.each do |vendor|
      purveyor << vendor if vendor.inventory.include?(item)
    end
    purveyor
  end

end
