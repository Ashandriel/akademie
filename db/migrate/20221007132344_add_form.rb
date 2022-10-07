class AddForm < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.datetime  :date      
      t.string    :sex
      t.string    :vorname     
      t.string    :name   
      t.string    :email    
      t.string    :phone  
      t.string    :city
      t.string    :street
      t.text      :text, limit: 16380
    end
  end
end