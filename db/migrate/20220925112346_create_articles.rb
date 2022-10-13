class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.datetime  :date      
      t.string    :title     
      t.text      :intro, limit: 16380     
      t.string    :author    
      t.string    :category  
      t.string    :sources
      t.text      :image_data
      t.string    :image_sources
      t.string    :video
      t.string    :teaser
      t.boolean   :publish
      t.text      :keywords, limit: 32380
      t.text      :text, limit: 16380
    end
  end
end
