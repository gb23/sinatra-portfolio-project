class UserFridge < ActiveRecord::Base
  belongs_to :user
  belongs_to :fridge
end