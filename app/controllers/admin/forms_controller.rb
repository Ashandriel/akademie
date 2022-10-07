class Admin::FormsController < Admin::AdminController 
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  
  def index   
    @forms = Form.all
    @form = Form.new
  end

  def show
    @forms = Form.find(params[:id])
  end

  def new
    @form = Form.new
  end


  def create
    @form = Form.new(form_params)
    @form.date = Time.now

    if @form.save
      redirect_to [:admin, @form], notice: 'Ein neuer Artikel wurde angelegt! :)'
    else
      render :new
    end    
  end
  



  def destroy
    @form = Form.find(params[:id])
    if @form.present?
      @form.destroy
    end
    redirect_to [:admin, @form], notice: 'Formular erfolgreich gelöscht.'
  end


  private
    def set_form
      @form = Form.find(params[:id])
    
    end

    def form_params
      params.require(:form).permit(:id, :date, :sex, :vorname, :name, :email, :street, :city, :phone, :text)
    end

end