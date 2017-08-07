class Item < ActiveRecord::Base
  belongs_to :fridge
  has_many :users, through: :fridge
  include Slugifiable::InstanceMethods
end