class TimeEntriesController < InheritedResources::Base
  actions :all

  def create
    create! { collection_url }
    if resource.valid?
      TimeEntryMailer.new_time_entry(current_user, resource).deliver
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