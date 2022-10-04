class Admin::TasksController < Admin::AdminController 
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index   
    @tasks = Task.all
    @task = Task.new
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to [:admin, @task], notice: 'Ein neuer Artikel wurde angelegt! :)'
    else
      render :new
    end    
  end
  

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to admin_tasks_path, notice: 'Aufgabe was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @task = Task.find(params[:id])
    if @task.present?
      @task.destroy
    end
    redirect_to [:admin, @task], notice: 'Artikel erfolgreich gelöscht.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    
    end

    def task_params
      params.require(:task).permit(:id, :number, :end, :title, :assignment_text)
    end

end