class User < ActiveRecord::Base

  has_many :availabilities

  attr_accessible :name
end