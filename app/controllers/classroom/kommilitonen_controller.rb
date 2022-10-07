class Classroom::KommilitonenController < Classroom::ClassroomController 

	def index
		@task_articles = TaskArticle.order(:task_id, :author).all
		
	end

	def show

	end
end