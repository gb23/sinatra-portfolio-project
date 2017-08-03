class Item < ActiveRecord::Base
  belongs_to :fridge
  has_many :users, through: :fridge
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end