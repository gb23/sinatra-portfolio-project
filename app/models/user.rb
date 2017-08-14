class User < ActiveRecord::Base
  has_many :user_fridges
  has_many :fridges, through: :user_fridges
  has_many :items, through: :fridges

  validates :username, presence: true
  validates :password, presence: true
  has_secure_password

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end