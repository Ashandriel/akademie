class AddTasks < ActiveRecord::Migration[5.1]
  def change
    create_table  :task_articles do |t|
      t.datetime  :date      
      t.string    :title     
      t.string    :intro     
      t.string    :author    
      t.string    :category  
      t.string    :sources
      t.text      :image_data
      t.string    :image_sources
      t.string    :video
      t.string    :teaser
      t.integer   :user_id      
      t.integer   :task_id      
      t.text      :keywords, limit: 16380
      t.text      :text, limit: 16380
      t.belongs_to :user, index: true
      t.belongs_to :task, index: true
    end

    create_table  :tasks do |t|
      t.datetime  :end
      t.string    :number
      t.string    :title
      t.text      :assignment_text, limit: 16380
    end


  end
end
