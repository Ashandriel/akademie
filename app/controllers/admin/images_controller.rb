class Admin::ImagesController < Admin::AdminController 
	before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index   
    @images = Image.all
    @image = Image.new
  end

  def show
    @images = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def edit
    @images = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)
    
    if @image.save
      redirect_to [:admin, @image], notice: 'Eine neue Nachricht wurde angelegt! :)'
    else
      render :new
    end    
  end
  

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to admin_images_path, notice: 'Nachricht wurde aktualisiert.'
    else
      render :edit
    end
  end


  def destroy
    @image = Image.find(params[:id])
    if @image.present? 
      @image.destroy
    end
    redirect_to [:admin, @image], notice: 'Nachricht erfolgreich gelöscht.'
  end

private
  def set_image
    @image = Image.find(params[:id])  
  end

  def image_params
    params.require(:image).permit(:image_title, :image_data, :image_sources, :image_url, :image )
  end

end