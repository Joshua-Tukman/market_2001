require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/item'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
    assert_instance_of Item, @item1
    assert_instance_of Item, @item2
  end

  def test_it_has_attributes
    assert_equal "Tomato", @item2.name
    assert_equal 0.50, @item2.price
    assert_equal Hash.new, @vendor.inventory
  end

  def test_it_can_return_item_stock_when_empty
    assert_equal 0, @vendor.check_stock(@item1)
  end

  def test_it_can_add_stock_to_inventory
    @vendor.stock(@item1, 30)

    expected = {@item1 => 30}
    assert_equal expected, @vendor.inventory
    assert_equal 30, @vendor.check_stock(@item1)

    @vendor.stock(@item1, 25)
    assert_equal 55, @vendor.check_stock(@item1)
  end

  def test_it_can_have_add_items_to_inventory
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    @vendor.stock(@item2, 12)

    expected = {@item1 => 55, @item2 => 12}
    assert_equal expected, @vendor.inventory
  end

end
