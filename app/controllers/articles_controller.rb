class ArticlesController < FrontendController
	layout "article"

	def index
		@published_articles = Article.where(publish: true, category: nil).order(date: :desc).page(params[:page]).per(10)
	end

	def show
		@article =  Article.find(params[:id])		
	end

end