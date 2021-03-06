class ArticlesController < InheritedResources::Base
  actions :index, :new, :create

  def toggle_read
    read = resource.toggle_read(current_user)
    respond_to do |format|
      format.json { render json: read }
      format.html { redirect_to collection_url }
    end
  end

  def create
    create! do |success, failure|
      ArticleMailer.new_article(current_user, resource).deliver if success.present?
      success.html { redirect_to collection_url }
    end
  end

  protected
    def collection
      if params[:sort]
        @articles = Article.order(params[:sort] + " " + params[:direction])
      elsif params[:query] && params[:query] != ""
        @articles = Article.text_search(params[:query])#.page(params[:page]).per_page(5)
      else
        @articles = Article.order('created_at desc')
      end
      # @articles ||= end_of_association_chain.page(params[:page]).per(10)
    end

    def permitted_params
      params.permit! || {}
    end
end
