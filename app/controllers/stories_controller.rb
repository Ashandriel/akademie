class StoriesController < FrontendController
  layout "application" # falls dein article-Layout @article erwartet
  def index
    @published_articles = Article.friendly
                                 .where(publish: true, category: 'Lebensgeschichten')
                                 .order(date: :desc)
                                 .page(params[:page]).per(10)
  end
end
