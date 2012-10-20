class TimeEntriesController < InheritedResources::Base
  actions :all

  def create
    create!{ collection_url }
  end

  def update
    update! { collection_url }
  end

  protected
    def begin_of_association_chain
      current_user
    end
end