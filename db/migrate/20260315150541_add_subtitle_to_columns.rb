class AddSubtitleToColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :columns, :subtitle, :string
  end
end
