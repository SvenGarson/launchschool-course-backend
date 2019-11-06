class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# without fixing the problem
puts "\nBefore fixing the problem, quantity unchanged"
ie = InvoiceEntry.new('Phone', 5)
p ie.update_quantity(2) == 2
p ie.update_quantity(0) == 0
p ie.update_quantity(-5) == nil
p ie.quantity == 5

# reopening the class and fixing the problem
class InvoiceEntry
  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0
  end
end

puts "\nAfter fixing the problem, quantity does update properly"
ie = InvoiceEntry.new('Underwear', 250)
p ie.quantity == 250
ie.update_quantity(2)
p ie.quantity == 2
ie.update_quantity(0)
p ie.quantity == 0

=begin

  Alyssa is right, though 'it will fail' does not mean that the
  program throws and error, just that the behaviour of the code
  if not as expected.

  The problem is that Ruby checks whether the expression is
  assignment, i.e, there is an equal sign right to an identifier/
  word, and in this case, quantity = updated_count is assignment,
  so Ruby initializes a local variable if the conditional succeeds.

  The expected behaviour is to re-assign the instance variable
  quantity to the updated count.

  So overall, the way the code is written, it will have no effect
  other than return weird values, namely the updated_count or nil
  if the conditional fails.

  Just prefixing the quantity with @ will make Ruby re-assign
  the local variable @quantity.

=end