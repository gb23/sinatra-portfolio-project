class Item < ActiveRecord::Base
  belongs_to :fridge
  has_many :users, through: :fridge
  
  validates :name, presence: true
 
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end