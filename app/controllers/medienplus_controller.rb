class MedienplusController < FrontendController
	def index
		@published_articles = Article.where(publish: true).order(date: :desc).page(params[:page]).per(9) 
	end

	def show
		
	end
end