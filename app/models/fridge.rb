class Fridge < ActiveRecord::Base
    has_many :items
    has_many :user_fridges
    has_many :users, through: :user_fridges
    include Slugifiable::InstanceMethods
end