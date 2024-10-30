class Article < ApplicationRecord
  include ImageUploader[:image]
  extend FriendlyId
  
  friendly_id :title, use: :slugged
  
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :columns
  paginates_per 7
  
  default_scope { order(date: :desc) }
  
  # Erzwingt die Neugenerierung des Slugs, wenn kein Slug vorhanden ist oder der Titel sich ändert
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
