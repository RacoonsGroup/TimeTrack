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

  protected
    def begin_of_association_chain
      current_user
    end
end