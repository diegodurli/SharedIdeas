class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :topic_id

      t.timestamps
    end
    add_index :comments, :topic_id
  end
end
