module DateRangeHelper

  def prev_iteration_start(date)
    if date.mday < 16
      date.prev_month.beginning_of_month + 15.day
    else
      date.beginning_of_month
    end
  end

  def this_iteration_start(date)
    if date.mday < 16
      date.beginning_of_month
    else
      date.beginning_of_month + 15.day
    end
  end

  def prev_iteration_end(date)
    if prev_iteration_start(date).mday == 1
      prev_iteration_start(date) + 14.day
    else
      prev_iteration_start(date).end_of_month
    end
  end

end
