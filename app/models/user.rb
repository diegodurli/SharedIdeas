class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable :recoverable, :rememberable, :trackable, :registerable
  devise :database_authenticatable, :validatable
  attr_accessible :email, :password, :password_confirmation
  has_many :topics, dependent: :destroy

end