class AddDocumentToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :document, :string

  end
end
