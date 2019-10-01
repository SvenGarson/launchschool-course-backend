class Wallet
  include Comparable

  attr_reader :amount
  protected :amount

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

=begin

  Observations further exploration
  --------------------------------

  Using protected methods seems like an obvious choice
  when we need to encapsulate functionality and state,
  but still need access in between these objects for
  queries, ordering and so on.

  If the nature of the data stored is private, dangerous
  i.e should generally be kept outside of 'public' knowledge,
  then protected is a good choice when we need to call
  methods in between objects and avoid any invalid mutation
  or sharing of data.

  Maybe bank account would be a candidate for such an approach.

=end