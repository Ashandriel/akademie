class MedienplusController < FrontendController
	def index
		@published_articles = Article.where(publish: true).all		
	end

	def show
		
	end
end