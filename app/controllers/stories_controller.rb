class StoriesController < FrontendController
  layout "application" # falls dein article-Layout @article erwartet

  def index
    @published_articles =
      Article.friendly
             .where(publish: true, category: 'Lebensgeschichten')
             .order(date: :desc, id: :desc)
             .page(params[:page])
             .per(10)

    articles_for_page = @published_articles.to_a
    @hero_article = articles_for_page.first
    @grid_articles = articles_for_page.drop(1)
  end
end