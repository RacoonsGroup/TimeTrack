class TimeEntriesController < InheritedResources::Base
  include TimeEntriesHelper
  actions :all
  
  def index
    if can?(:manage,:time_entries)
      @time_entries= Kaminari.paginate_array(TimeEntry.all).page(params[:page])
    else
      index!{ collection_url }
    end
  end

  def show
    if can?(:manage,:time_entries)
      @time_entry = TimeEntry.find(params[:id])
    else
      show!{ collection_url }
    end
  end

  def create
    params[:time_entry][:real_time] = pretty_time(params[:time_entry][:real_time])
    create! do |success, failure|
      TimeEntryMailer.new_time_entry(current_user, resource).deliver if success.present?
      success.html { redirect_to collection_url }

    end
  end

  def edit
    if can?(:manage,:time_entries)
      @time_entry = TimeEntry.find(params[:id])
    else
      edit!{ collection_url }
    end
  end

  def update
    params[:time_entry][:real_time] = pretty_time(params[:time_entry][:real_time])
    if can?(:manage,:time_entries)
      @time_entry=TimeEntry.find(params[:id])
      if @time_entry.update_attributes(params[:time_entry])
        redirect_to @time_entry
      else
        #render action: "edit"
      end
    else
      update!{ collection_url }
    end
  end
  
  def destroy
    if can?(:manage,:time_entries)
      @time_entry=TimeEntry.find(params[:id])
      @time_entry.destroy
      redirect_to time_entries_url
    else
      destroy!{collection_url}
    end
  end
  
  protected
    def begin_of_association_chain
      current_user
    end

    def collection
      @time_entries ||= end_of_association_chain.order('date desc').page(params[:page])
    end
end