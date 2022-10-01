class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.datetime  :date
      t.string    :time
      t.string    :message_text
      t.string    :link
      t.string    :link_text
    end
  end
end
