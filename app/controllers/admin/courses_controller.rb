class Admin::CoursesController < Admin::AdminController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.order(:position, :id)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to [:admin, @course], notice: 'Kurs wurde angelegt.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to admin_courses_path, notice: 'Kurs wurde aktualisiert.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to admin_courses_path, notice: 'Kurs wurde gelöscht.'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(
      :title, :text_one, :text_two, :pdf_url, :is_published, :position
    )
  end
end
