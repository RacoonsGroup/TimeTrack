module TimeEntriesHelper

  def pretty_time(time_s)
    # Requested by Fedor (or not)
    # Convert time like H:M to H.(m*100/60)
    if time_s =~ /(\d?)\d:\d\d/
      hours, minutes = time_s.split(":")
      minutes = (minutes.to_i * 5 / 3).to_i
      return (hours.to_i + (minutes.to_f / 100)).to_s
    end
    return time_s
  end

end
