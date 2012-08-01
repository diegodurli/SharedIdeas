class Gallery < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :documents, dependent: :destroy
end
