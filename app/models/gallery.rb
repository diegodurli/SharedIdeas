class Gallery < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :documents, dependent: :destroy
  validates_presence_of :name
end
