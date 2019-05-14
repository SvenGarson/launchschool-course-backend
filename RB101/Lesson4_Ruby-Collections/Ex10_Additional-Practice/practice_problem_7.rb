statement = "The Flintstones Rock"

result_hash = {}
alphabet = ('A'..'Z').to_a + ('a'..'z').to_a

for ch in alphabet do
  count = statement.count(ch)
  result_hash[ch] = count if count > 0
end

puts result_hash