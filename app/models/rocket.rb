class Rocket < ActiveRecord::Base
  has_many :payloads
  has_many :launches
  belongs_to :organization
end