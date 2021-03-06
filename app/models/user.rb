class User < ActiveRecord::Base
  has_many :user_fridges
  has_many :fridges, through: :user_fridges
  has_many :items, through: :fridges

  validates :username, presence: true
  validates :password, presence: true
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  has_secure_password

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end