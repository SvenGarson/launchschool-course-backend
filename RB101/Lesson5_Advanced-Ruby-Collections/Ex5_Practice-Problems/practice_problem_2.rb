# order array of hashes from earliest to latest year of publication
#                            ^^^^^^^^    ^^^^^^

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted = books.sort_by do |book|
           book[:published].to_i
         end

puts '=== Orgiginal ==='
books.each_with_index { |book, index| puts "#{index}) #{book}"}
puts '=== Sorted  ==='
sorted.each_with_index { |book, index| puts "#{index}) #{book}"}