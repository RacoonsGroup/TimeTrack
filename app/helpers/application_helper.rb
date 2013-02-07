module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize    
    direction = (column == params[:sort]) && (params[:direction] == "asc") ? "desc" : "asc"
    link_to title, sort: column, direction: direction
    #column
  end

  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

end
