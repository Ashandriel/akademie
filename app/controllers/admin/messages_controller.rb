class Admin::MessagesController < Admin::AdminController 
  before_action :set_message, only: [:show, :edit, :update, :destroy]
 
  def index   
    @messages = Message.all
    @message = Message.new
  end

  def show
    @messages = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def edit
    @messages = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    
    if @message.save
      redirect_to [:admin, @message], notice: 'Eine neue Nachricht wurde angelegt! :)'
    else
      render :new
    end    
  end
  

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to admin_messages_path, notice: 'Nachricht wurde aktualisiert.'
    else
      render :edit
    end
  end


  def destroy
    @message= Message.find(params[:id])
    if @message.present? 
      @message.destroy
    end
    redirect_to [:admin, @message], notice: 'Nachricht erfolgreich gelöscht.'
  end

private
  def set_message
    @message = Message.find(params[:id])  
  end

  def message_params
    params.require(:message).permit(:date, :time, :message_text, :link, :link_text)
  end

end