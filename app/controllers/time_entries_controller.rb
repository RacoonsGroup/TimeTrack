class TimeEntriesController < InheritedResources::Base
  include TimeEntriesHelper
  actions :all

  def create
    params[:time_entry][:real_time] = pretty_time(params[:time_entry][:real_time])
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

    def collection
      @time_entries ||= end_of_association_chain.order('date desc').page(params[:page])
    end
end
