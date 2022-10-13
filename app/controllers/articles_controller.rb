class ArticlesController < FrontendController

	def index
		@published_articles = Article.where(publish: true).order(date: :desc).all		
	end

	def show
		@article =  Article.find(params[:id])		
	end

end