class ArticlesController < FrontendController
	layout "article"

	def index
		@published_articles = Article.friendly.where(publish: true, category: nil).order(date: :desc).page(params[:page]).per(10)
	end

	def show
		@article =  Article.friendly.find(params[:id])		
	end

end