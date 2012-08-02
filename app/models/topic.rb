class Topic < ActiveRecord::Base
  attr_accessible :title, :description, :user_id
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :title, :description
end
