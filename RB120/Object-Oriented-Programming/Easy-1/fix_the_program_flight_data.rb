class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

=begin

  Observations
  ------------

  Making a flight database handle open to public usage
  at first sight seems like an obvious, very very bad idea.

  If we needed to actually select, add, delete and transform
  the databse at some point, it would be better to implement
  that functionality in a more explicit way by, for instance,
  providing the necessary methods for queries, transormations,
  etc. in a ways that the input/output is validated.

  The end goal being off course that the database can not be
  accessed in a malicious way, which includes the retrieval
  and insertion of critical/private data as well as any
  other dangerous operations I cannot think of right now.

=end