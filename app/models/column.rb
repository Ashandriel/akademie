class Column < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :articles

  def should_generate_new_friendly_id?
    title_changed? || super
  end
end