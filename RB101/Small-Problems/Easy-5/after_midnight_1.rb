def time_of_day(minutes)
  direction = minutes <=> 0
  hrs = (minutes.abs / 60) % 24
  mins = minutes.abs % 60
  
  # compute hours based on hours and minutes
  clock_hours = nil
  clock_minutes = nil
  case direction
  when  1
    clock_hours = hrs
    clock_minutes = mins
  when -1
    clock_hours = 24 - hrs
    clock_hours -= 1 if mins > 0
    clock_minutes = 60 - mins
  else
    clock_hours = 0
    clock_minutes = 0
  end

  format("%02d:%02d", clock_hours, clock_minutes)

end


p time_of_day(0)      == "00:00"
p time_of_day(-3)     == "23:57"
p time_of_day(35)     == "00:35"
p time_of_day(-1437)  == "00:03"
p time_of_day(3000)   == "02:00"
p time_of_day(800)    == "13:20"
p time_of_day(-4231)  == "01:29"