class Document < ActiveRecord::Base
  attr_accessible :gallery_id, :name, :document
  belongs_to :gallery

  mount_uploader :document, DocumentUploader
end
