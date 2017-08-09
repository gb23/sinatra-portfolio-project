class User < ActiveRecord::Base
  has_many :user_fridges
  has_many :fridges, through: :user_fridges
  has_many :items, through: :fridges

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_secure_password



end