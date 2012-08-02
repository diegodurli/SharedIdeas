class Comment < ActiveRecord::Base
  attr_accessible :description, :topic_id
  belongs_to :topic
  validates_presence_of :description
end
