class ColumnsController < ApplicationController
  def index
    @columns = Column.all
  end

  def show
    @column = Column.friendly.find(params[:id])

    short_path =
      case @column.slug
      when "kommentare"
        kommentare_path
      when "buch-tresen"
        buch_tresen_path
      when "medien-tresen"
        medien_tresen_path
      else
        nil
      end

    if short_path.present? && request.path != short_path
      target = request.query_string.present? ? "#{short_path}?#{request.query_string}" : short_path
      return redirect_to target, status: :moved_permanently
    end

    @articles = @column.articles.page(params[:page]).per(9)
  end

  def overview
    @columns = Column.includes(:articles).all
  end

  def articles
    @column = Column.friendly.find(params[:id])
    @articles = @column.articles.order(created_at: :desc)
  end
end