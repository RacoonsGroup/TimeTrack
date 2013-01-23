module Api
  class TimeEntriesController < ActionController::Base

    def index
      user = authenticate!
      if user
        time_entries = user.time_entries.order("created_at")
        render json: { response: { time_entries: time_entries } }
      else
        render json: { error: { messages: ["Authentication failure"] } }
      end
    end

    def create
      user = authenticate!
      if user
        time_entry = user.time_entries.new({ name:      params[:name],
                                             project:   params[:project],
                                             date:      params[:date].to_date,
                                             real_time: params[:real_time].to_f,
                                             status:    params[:status],
                                           })
        if time_entry.save
          render json: { response: { status: "OK" } }
        else
          render json: { error: { messages: time_entry.errors.full_messages } }
        end
      else
        render json: { error: { messages: ["Authentication failure"] } }
      end
    end


    protected

    def authenticate!
      digest = params[:digest]
      email, password = Base64.decode64(digest).split(';', 2)
      user = User.find_for_database_authentication(email: email)
      (user && user.valid_password?(password)) ? user : false
    end

  end
end
