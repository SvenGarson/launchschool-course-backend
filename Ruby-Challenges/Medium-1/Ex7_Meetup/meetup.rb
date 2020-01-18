require 'date'

class Meetup

  TEENTH_DAYS = [13, 14, 15, 16, 17, 18, 19]
  SCHEDULE_INDEX_MAP = {
    first:   0,
    second:  1,
    third:   2,
    fourth:  3,
    last:   -1
  }

  def initialize(month, year)
    self.date_today = Date.new(year, month)
  end

  def day(day, count)
    candidate_dates = days_date_list(day)
    
    if count == :teenth
      candidate_dates.find { |date| TEENTH_DAYS.include?(date.day) }
    else
      desired_day_index = SCHEDULE_INDEX_MAP[count]
      candidate_dates[desired_day_index]
    end
    
  end

  private

  def days_date_list(day)
    dates_this_month.select do |date|
      is_date_string = "#{day.to_s}?"
      date.respond_to?(is_date_string) && date.__send__(is_date_string)
    end
  end

  def dates_this_month
    today = date_today
    (1..days_this_month).each_with_object(Array.new) do |day, dates|
      dates << Date.new(today.year, today.month, day)
    end
  end

  def days_this_month
    date_today.next_month.prev_day.day
  end

  attr_accessor(:date_today)

end