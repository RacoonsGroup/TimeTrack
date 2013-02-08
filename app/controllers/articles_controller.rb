class ArticlesController < InheritedResources::Base
  actions :index, :new, :create

  def toggle_read
    resource.toggle_read(current_user)
    respond_to do |format|
      format.json { render json: resource }
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
      else
        @articles = Article.all
      end
      # @articles ||= end_of_association_chain.page(params[:page]).per(10)
    end
end
