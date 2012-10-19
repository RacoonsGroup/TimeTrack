class TimeEntriesController < InheritedResources::Base
  actions :all

  protected
    def begin_of_association_chain
      current_user
    end
end