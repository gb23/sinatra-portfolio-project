class Fridge < ActiveRecord::Base
    has_many :items
    has_many :user_fridges
    has_many :users, through: :user_fridges

    validates :name, presence: true
    
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end