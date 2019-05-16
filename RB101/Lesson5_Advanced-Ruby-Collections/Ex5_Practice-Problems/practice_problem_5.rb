# compute the total age of the male members of the munsters family hash

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_males_age = 0

munsters.each_value do |details|
  total_males_age += details['age'] if details['gender'] == 'male'
end

puts "Total males age: #{total_males_age}"