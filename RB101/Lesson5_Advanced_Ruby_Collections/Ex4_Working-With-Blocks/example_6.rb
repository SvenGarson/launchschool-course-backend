=begin

  - Select returns a new Hash containing the objects for which the block
    returned a truthy value
  
  - Select iterates over every hash in the original array

  - Enumerable#all? goes through all the key value pairs in the currently iterated hash
    and check whether provided block is returns true for all the entries in the hash

  - If every entry in the currently iterated hash, each, have the same first character
    in the value as in the key, Enumerable@all? returns true and false if the block returns
    a falsey value, even once.

  - The select method then adds the currently iterated hash to the new array if the
    all? method returned true

  - This happens to be only true for the {c: 'cat'} hash in the original array, so
    that is the only hash that is added to the new array and returned from the select
    method

  - If Enumerable#any? was used, every hash that has at least one key value pair, where
    the first character of the value is the same as the key as string would be added to
    the new array returned by Array#select, since now in order for the block to return
    true, the any? method would return true if the provided block returns a truthy value
    once. This is the case for both hashed in the orignal array, which would lead to the
    new array containing the same hashed as the original one.

=end

puts '===================='
puts 'Using Enumerable#all?'
puts '===================='

result = [{ a: 'ant', b: 'elephant' }, { c: 'cat'}].select do |hash|
           hash.all? do |key, value|
             value[0] == key.to_s
           end
         end

p result

puts '===================='
puts 'Using Enumerable#any?'
puts '===================='

result = [{ a: 'ant', b: 'elephant' }, { c: 'cat'}].select do |hash|
           hash.any? do |key, value|
             value[0] == key.to_s
           end
         end

p result