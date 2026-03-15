class ColumnsController < ApplicationController
  def index
    @columns = Column.all
  end

  def show
    @column = Column.friendly.find(params[:id])
    @articles = @column.articles.page(params[:page]).per(9)
  end

  def overview
    @columns = Column.includes(:articles).all # Lädt alle Kolumnen mit ihren Artikeln
  end

  def articles
    @column = Column.friendly.find(params[:id])
    @articles = @column.articles.order(created_at: :desc) # Hole alle Artikel der Kolumne, sortiert nach Erstellungsdatum
  end

end