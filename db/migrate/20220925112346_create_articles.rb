class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.datetime  :date      
      t.string    :title     
      t.string    :intro     
      t.string    :author    
      t.string    :category  
      t.string    :sources
      t.string    :image
      t.string    :image_sources
      t.string    :video
      t.string    :teaser
      t.boolean   :publish
      t.text      :keywords, limit: 16380
      t.text      :text, limit: 16380
    end
  end
end
