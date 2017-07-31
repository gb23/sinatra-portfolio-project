class Rocket < ActiveRecord::Base
  has_many :payloads
  has_many :events
  belongs_to :organization
end