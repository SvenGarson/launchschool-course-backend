SQ_FOOT_TO_SQ_INCH = 144.0
SQ_FOOT_TO_SQ_METER = 1.0 / 10.7639

print "Enter room length in feet: "
length = gets.chomp.to_f
print "\n"

print "Enter room width in feet: "
width = gets.chomp.to_f
print "\n"

sq_feet = length * width
sq_inch = sq_feet * SQ_FOOT_TO_SQ_INCH
sq_meter = sq_feet * SQ_FOOT_TO_SQ_METER

print format("%.2f square feet is %.2f square inch and %.2f square meter\n\n",
            sq_feet, sq_inch, sq_meter)