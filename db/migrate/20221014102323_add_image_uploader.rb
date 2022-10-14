class AddImageUploader < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|     
      t.string    :image_title     
      t.text      :image_data
      t.string    :image_sources
      t.string    :image_url
    end
  end
end
