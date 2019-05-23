vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck',
  'suv', 'SuV', 'SUv'
]

def count_occurences(arr)
  count_hsh = {}
  arr.each do |i|
    i = i.downcase
    next if count_hsh.key?(i)
    count = arr.count { |k| i == k.downcase}
    count_hsh[i] = count
  end

  count_hsh.each do |obj, count|
    puts "#{obj} => #{count}"
  end
end

count_occurences(vehicles)