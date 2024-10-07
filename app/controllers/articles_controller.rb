class ArticlesController < FrontendController

	def index
		@published_articles = Article.where(publish: true).where.not(category: 'Kolumne').order(date: :desc).page(params[:page]).per(9)
	end

	def show
		@article =  Article.find(params[:id])		
	end

end