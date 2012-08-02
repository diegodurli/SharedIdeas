class Document < ActiveRecord::Base
  attr_accessible :gallery_id, :name, :document
  belongs_to :gallery
  validates_presence_of :name, :document

  mount_uploader :document, DocumentUploader
end
