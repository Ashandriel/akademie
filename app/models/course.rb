class Course < ApplicationRecord
  # Scopes
  scope :published, -> { where(is_published: true) }
  scope :ordered,   -> { order(:position, :id) }

  # Validations
  validates :title, presence: true

end