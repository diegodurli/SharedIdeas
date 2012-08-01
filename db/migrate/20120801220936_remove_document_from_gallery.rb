class RemoveDocumentFromGallery < ActiveRecord::Migration
  def up
    remove_column :galleries, :document
  end

  def down
    add_column :galleries, :document
  end
end
