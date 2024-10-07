class PagesController < FrontendController

	def index
		@published_articles = Article.where(publish: true).limit(4).order(date: :desc)		
	end
end