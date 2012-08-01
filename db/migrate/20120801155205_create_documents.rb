class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :document
      t.integer :gallery_id

      t.timestamps
    end
    add_index :documents, :gallery_id
  end
end
