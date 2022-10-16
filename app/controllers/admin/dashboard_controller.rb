class Admin::DashboardController < Admin::AdminController
  def index
    @articles = Article.all
    @articles_published = Article.where(publish: true)
    @users = User.all
    @students = User.where(role: 'student')
    @task_articles = TaskArticle.all
    @tasks = Task.all
    @messages = Message.all
    @forms = Form.all
  end
end
