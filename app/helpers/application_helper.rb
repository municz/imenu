require 'date'

module ApplicationHelper
  
  #start of date-menu helpers
  def next_business_day(date)
    skip_weekends(date, 1)
  end    

  def previous_business_day(date)
    skip_weekends(date, -1)
  end

  def current_business_day(date)
    while (date.wday % 7 == 0) or (date.wday % 7 == 6) do
     date += 1
    end
    date
  end

  def skip_weekends(date, inc)
    date += inc
    while (date.wday % 7 == 0) or (date.wday % 7 == 6) do
      date += inc
    end   
    date
  end
  #end of date-menu helpers
end
