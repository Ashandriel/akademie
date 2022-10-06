class MedienplusController < FrontendController
	def index
		@published_articles = Article.where(publish: true).all.order(date: :desc)				
	end

	def show
		
	end
end