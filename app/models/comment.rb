class Comment < ActiveRecord::Base
  attr_accessible :description, :topic_id
  belongs_to :topic
end
