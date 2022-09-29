class Article < ApplicationRecord
	include ImageUploader[:image]
end