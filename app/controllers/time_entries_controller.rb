class TimeEntriesController < InheritedResources::Base
  actions :all

  def create
    create! do |success, failure|
      TimeEntryMailer.new_time_entry(current_user, resource).deliver if success.present?
      success.html { redirect_to collection_url }
    end
  end

  def update
    update!{ collection_url }
  end

  def edit
    edit!{ collection_url }
  end

  def index
    @page = params[:page] or 1
    @time_entries = TimeEntry.where(:user_id => current_user.id).page(@page)
  end

  protected
    def begin_of_association_chain
      current_user
    end

    def collection
      @time_entries ||= end_of_association_chain.order('date desc').page(params[:page]).per(10)
    end
end
