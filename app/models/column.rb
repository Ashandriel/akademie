class Column < ApplicationRecord
	has_and_belongs_to_many :articles
end
