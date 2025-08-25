class PagesController < FrontendController

	def index
		@published_articles = Article.friendly.where(publish: true).limit(5).order(date: :desc)		
	end

  def unterstuetzen
    @published_articles = Article.friendly.where(publish: true).limit(3).order(date: :desc)		
  end

  def courses
    @courses = Course.published.ordered
  end
    
end