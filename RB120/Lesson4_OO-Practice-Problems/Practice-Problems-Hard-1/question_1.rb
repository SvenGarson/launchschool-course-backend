class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
    puts "# Log added to Database #"
  end
end

class SecretFile

  private
  attr_reader :security_logger
  public

  def initialize(secret_data, security_logger)
    @data = secret_data
    @security_logger = security_logger
  end

  def data
    # log it
    security_logger.create_log_entry
    # return the secret data
    @data
  end
end

sec_logger = SecurityLogger.new
secret = SecretFile.new('Code: 15874415', sec_logger)
puts secret.data

=begin

  Requirements
  ------------
    - Add logging when secret data is requested
    - We can modify the SecretFile#initialize method
    - Instance of Logger passed in as additional argument

  First we get rid of the auto-generated getter for the
  'data' attribute, then we implement our own that logs
  the request for the secret data and then return the
  data.

  We initialize every secret file with an instance of
  a logger, and to make things more idiomatic, we can add
  private getters for the data and logger

=end