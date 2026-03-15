class AddSlugToColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :columns, :slug, :string
    add_index :columns, :slug, unique: true
  end
end
