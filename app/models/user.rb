class User < ActiveRecord::Base
  has_many :user_fridges
  has_many :fridges, through: :user_fridges
  has_many :items, through: :fridges

  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end