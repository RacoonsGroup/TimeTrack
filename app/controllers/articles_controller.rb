class ArticlesController < InheritedResources::Base
  actions :index, :new, :create

  # def create
  #   create! do |success, failure|
  #     TimeEntryMailer.new_time_entry(current_user, resource).deliver if success.present?
  #     success.html { redirect_to collection_url }
  #   end
  # end
  protected
    def collection
      @articles ||= end_of_association_chain.page(params[:page]).per(10)
    end
end
