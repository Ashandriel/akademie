class Image < ApplicationRecord
	include ImageUploader[:image]
	paginates_per 30
end