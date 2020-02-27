require 'date'

class Meetup
  TEENTH_DAYS = (13..19)

  ORDINAL_INDEX_MAP = {
    first:  0,
    second: 1,
    third:  2,
    fourth: 3,
    last:   -1
  }

  def initialize(month, year)
    self.meetup_month = Date.new(year, month)
    self.all_month_dates = determine_all_month_days
  end

  def day(weekday, schedule)
    weekday_dates = all_weekday_dates(weekday)

    if schedule == :teenth
      weekday_dates.find { |candidate| TEENTH_DAYS.cover?(candidate.day) }
    else
      weekday_dates[ORDINAL_INDEX_MAP[schedule]]
    end
  end

  private

  def all_weekday_dates(weekday)
    weekday_name_inquiry = weekday.to_s + "?"

    all_month_dates.select do |month_date|
      respond_to_weekday = month_date.respond_to?(weekday_name_inquiry)
      is_weekday = month_date.__send__(weekday_name_inquiry)

      respond_to_weekday && is_weekday
    end
  end

  def meetup_month_total_days
    meetup_month.next_month.prev_day.day
  end

  def determine_all_month_days
    (1..meetup_month_total_days).map do |day|
      Date.new(meetup_month.year, meetup_month.month, day)
    end
  end

  attr_accessor(:meetup_month, :all_month_dates)
end
