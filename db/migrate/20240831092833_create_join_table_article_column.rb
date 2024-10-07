class CreateJoinTableArticleColumn < ActiveRecord::Migration[5.1]
  def change
    create_join_table :articles, :columns do |t|
      t.index [:article_id, :column_id]
      t.index [:column_id, :article_id]
    end
  end
end
