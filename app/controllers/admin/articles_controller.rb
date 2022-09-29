class Admin::ArticlesController < Admin::AdminController 
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    
    @articles = Article.all
    @article = Article.new

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
      if @article.save
        redirect_to [:admin, @article], notice: 'Ein neuer Artikel wurde angelegt! :)'
      else
        render :new
      end    
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: 'article was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @article= Article.find(params[:id])
    if @article.present?
      @article.destroy
    end
    redirect_to [:admin, @article], notice: 'Artikel erfolgreich gelöscht.'
  end


  #def show_image
  #  @article = article.find(params[:id])
  #  send_data @article.image, :type => 'image/png',:disposition => 'inline'
  #end


  private
    def set_article
      @article = Article.find(params[:id])
    
    end

    def article_params
      params.require(:article).permit(:id, :date, :title, :intro, :author, :category, :sources, :image, :image_sources, :video, :teaser, :text, :keywords, :publish )
    end

end
