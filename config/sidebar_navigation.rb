
SimpleNavigation::Configuration.run do |sidebar|
  sidebar.items do |primary|
  	primary.dom_class = "nav nav-list"
    primary.item :MyTimeEntries, 'My time entries', time_entries_path
    primary.item :Articles, 'Articles', articles_path
    primary.item :Statistics, 'Statistics', statistics_path
  end
end
