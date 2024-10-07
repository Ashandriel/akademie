class Article < ApplicationRecord
	include ImageUploader[:image]
		has_and_belongs_to_many :categories
		has_and_belongs_to_many :columns
	  paginates_per 7

	  default_scope { order(date: :desc)}  
end