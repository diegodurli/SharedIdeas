class Comment < ActiveRecord::Base
  attr_accessible :description, :topic_id, :user_id
  belongs_to :topic
  validates_presence_of :description
  
  def get_user
    User.find(self.user_id)
  end
end
