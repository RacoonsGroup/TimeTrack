class ProjectsFilter
  
  def filter
    projects = Project.where(disable: [nil,false])
  end


end
