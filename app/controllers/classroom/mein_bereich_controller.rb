class Classroom::MeinBereichController < Classroom::ClassroomController 

	def index
		@task_articles = TaskArticle.all
		@my_articles = current_user.task_articles
		
	end

	def show

	end
end