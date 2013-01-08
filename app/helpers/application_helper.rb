module ApplicationHelper
	
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
