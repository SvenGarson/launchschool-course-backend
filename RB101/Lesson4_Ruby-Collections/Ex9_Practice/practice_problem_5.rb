=begin
  - if the hash is empty, shift return the default value of the
    hash which is nil.
  - if the hash is not empty, shift returns an array containing
    a key value pair like [key, value]
  which means in this case, probably the first entry added to the
  hash, since starting from ruby version 1.9 hashed should now
  be ordered by order of insertion?

  So the result should be [:a, "ant"]

=end

hash = { a: 'ant', b: 'bear'}
result = hash.shift

puts "result: #{result}"