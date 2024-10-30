class MedienplusController < FrontendController
  def index
    # Exkludiere Artikel, die zu einer Kolumne gehören
    @published_articles = Article.friendly.left_joins(:columns) # `:columns` ist die Assoziation
                                 .where(publish: true)
                                 .where(columns: { id: nil }) # Nur Artikel ohne Kolumne
                                 .order(date: :desc)
                                 .page(params[:page])
                                 .per(10)
  end

  def show
    # Detailansicht eines Artikels
  end
end
