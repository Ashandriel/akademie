class Admin::ColumnsController < Admin::AdminController 

  def index
    @columns = Column.all
  end

  def new
    @column = Column.new
  end

  def create
    @column = Column.new(column_params)
    if @column.save
      redirect_to [:admin, @column], notice: 'Eine neue Kolumne wurde angelegt! :)'
    else
      render :new
    end
  end

	def edit
	  @column = Column.find(params[:id])
	end

  def update
    @column = Column.find(params[:id])
    if @column.update(column_params)
      redirect_to admin_columns_path, notice: 'column was successfully updated.'
    else
      render :edit
    end
  end



  def show
    @column = Column.find(params[:id])
  end

  def destroy
    @column = Kolumn.find(params[:id])
    if @column.present?
      @column.destroy
    end
    redirect_to [:admin, @column], notice: 'Kolumne erfolgreich gelöscht.'
  end


  private

  def column_params
    params.require(:column).permit(:title, :content)
  end
end
