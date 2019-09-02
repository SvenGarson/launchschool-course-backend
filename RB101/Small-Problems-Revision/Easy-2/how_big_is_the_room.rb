=begin
  type:
    - program
  flow:
    - Enter the length of the room in meters:
    - get input
    - Enter the width of the room in meters:
    - get input
    - compute square meters and ft squared
    - The area of the room is X square meters (Y square feet).
  
  req:
    exp:
      - no need to validate input
      - 1 square meter = 10.7639 square feet
      - round to hundreds place

  exploration:

    conversion meters sq to ft sq:
      m2 * (ft2 / m2) = m2 * (10.7639 ft2 / 1 m2) 
                      = m2 * 10.7639

=end

FTSQ_PER_MSQ = (10.7639 / 1.0)

puts 'Enter the length of the room in meters:'
length_m2 = gets.chomp.to_f
puts 'Enter the width of the room in meters:'
width_m2 = gets.chomp.to_f
area_m2 = (length_m2 * width_m2).round(2)
area_ft2 = (area_m2 * FTSQ_PER_MSQ).round(2)
puts "The area of the room is #{area_m2} square meters (#{area_ft2} square feet)." 