class NotificationsController < InheritedResources::Base
  load_and_authorize_resource
  actions :all

  protected
    def collection
      @notifications = end_of_association_chain.current.order('start_date desc')
    end
end
