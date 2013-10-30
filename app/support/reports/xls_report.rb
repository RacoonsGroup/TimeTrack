class XlsReport
  TYPES = {
    simple:           {columns: [:name, :time_points, :url], width: [40, 9, 30]},
    advanced:         {columns: [:name, :project_name, :real_time, :time_points, :url , :date, :user_mail, :description], width:[40, 20, 9, 9, 30, 15, 20, 50]}
    }.with_indifferent_access

  def initialize(filters)
    @filters = filters
    @type = @filters[:report_type] || :simple
  end

  def get_xls
    time_entries.to_xls(only: type(@type)[:columns], column_width: type(@type)[:width])
  end

protected
  def type(type)
    if TYPES.has_key?(type)
      TYPES[type]
    else
      TYPES[:simple]
    end
  end

  def time_entries
    entries = StatisticsFilter.new(@filters[:user_id], @filters).filter
    if @type.to_s == 'simple'
      sum_same_tasks(entries)
    else
      entries
    end
  end

  def sum_same_tasks(tasks)
    tasks.each do |entry|
      sum = tasks.inject(0) do |sum, elem|
        if entry.name == elem.name
          sum += elem.time_points || 0
        else
          sum
        end
      end
      entry.time_points = sum
      tasks = tasks.delete_if do |elem|
        elem.name == entry.name && elem != entry
      end
    end
  end

end