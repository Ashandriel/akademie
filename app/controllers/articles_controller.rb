class ArticlesController < FrontendController
  layout "article"

  def index
    @published_articles =
      Article.friendly
             .where(publish: true, category: nil)
             .order(date: :desc, id: :desc)
             .page(params[:page])
             .per(10)
  end

  def search
    @q = params[:q].to_s.strip

    @published_articles =
      Article.friendly
             .where(publish: true)
             .text_search(@q)
             .order(date: :desc, id: :desc)
             .page(params[:page])
             .per(10)
  end


  def show
    @article = Article.friendly.find(params[:id])
  end
end
