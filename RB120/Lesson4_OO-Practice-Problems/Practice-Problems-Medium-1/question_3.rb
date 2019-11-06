class InvoiceEntry
  private
  attr_writer :quantity
  public
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end
end

puts "\nAfter fixing the problem, quantity does update properly"
ie = InvoiceEntry.new('Underwear', 250)
p ie.quantity == 250
ie.update_quantity(2)
p ie.quantity == 2
ie.update_quantity(0)
p ie.quantity == 0
ie.update_quantity(-1255)
p ie.quantity == 0

puts "\nBut does not enable us to change the state of 'quantity' externally!"
ie.quantity = 1_000_000

=begin

  Well, as we saw before it does fix the update_quantity
  method to behave as expected, but we can now externally
  set the quantity to anything we want, even other types of
  objects.

  We could just add a private writer/setter method for the
  quantity attribute and still call self.quantity = to update
  the instance variable, without giving the privacy of the
  internal state of quantity.

=end