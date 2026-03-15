class GenerateSlugsForColumns < ActiveRecord::Migration[5.1]
  class ColumnMigration < ActiveRecord::Base
    self.table_name = "columns"
  end

  def up
    ColumnMigration.reset_column_information

    ColumnMigration.where(slug: [nil, ""]).find_each do |column|
      next if column.title.blank?

      base_slug = column.title.parameterize
      slug = base_slug
      counter = 2

      while ColumnMigration.where.not(id: column.id).exists?(slug: slug)
        slug = "#{base_slug}--#{counter}"
        counter += 1
      end

      column.update_columns(slug: slug)
      puts "Generated slug for Column ##{column.id}: #{slug}"
    end
  end

  def down
  end
end