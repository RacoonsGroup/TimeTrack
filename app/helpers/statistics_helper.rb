module StatisticsHelper

  def progress_bar_percents
    today = Time.now.day
    salary_day = get_salary_day()

    if today > 15
      today -= 15
      salary_day -= 15
    end

    (today.to_f / salary_day * 100).to_i
  end


  def progress_bar_color(month_hours)
    # TODO: optimize this, pls
    today = Time.now.day
    salary_day = get_salary_day()

    days_until_salary = salary_day - today
    salary_point = ((month_hours / 20).to_i + 1) * 20

    eax = (days_until_salary * 8) - (salary_point - month_hours)
    if eax > 0
      "green"
    elsif eax == 0
      "yellow"
    else
      "red"
    end
  end


  protected

  def days_in_month
    date = Time.now
    year_days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    return 29 if date.month == 2 && Date.gregorian_leap?(date.year)
    year_days_in_month[date.month - 1]
  end


  def get_salary_day
    today = Time.now.day
    (today <= 15) ? 15 : days_in_month
  end

end
