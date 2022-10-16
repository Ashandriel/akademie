class Classroom::TaskArticlesController < Classroom::ClassroomController 
  before_action :set_task_article, only: [:show, :edit, :update, :destroy]
  include OwnerHelper
 
 def index   
    @task_articles = TaskArticle.all
    @task_article = TaskArticle.new
    @my_articles = current_user.task_articles
  end

  def show
    @task_articles = TaskArticle.find(params[:id])
  end

  def new
    @task_article = TaskArticle.new
  end

  def edit
    @task_articles = TaskArticle.find(params[:id])
  end

  def create
    @task_article = TaskArticle.new(task_article_params)
    @task_article.user_id = current_user.id if current_user
    @task_article.author = current_user.username

    if @task_article.save
      redirect_to :classroom 
    else
      render :new
    end    
  end
  

  def update
    @task_article = TaskArticle.find(params[:id])
    if @task_article.update(task_article_params)
      redirect_to classroom_task_articles_path, notice: 'article was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @task_article = TaskArticle.find(params[:id])
    if @task_article.present?
      @task_article.destroy
    end
    redirect_to [:classroom, @task_article], notice: 'Artikel erfolgreich gelöscht.'
  end

  private
    def set_task_article
      @task_article = TaskArticle.find(params[:id])
    
    end

    def task_article_params
      params.require(:task_article).permit(:id,:author, :title, :date, :category, :intro, :teaser, :text, :sources, :keywords, :task_id, :user_id)
    end

end