class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :text_one
      t.text :text_two
      t.string :pdf_url
      t.boolean :is_published
      t.integer :position
    end
  end
end
