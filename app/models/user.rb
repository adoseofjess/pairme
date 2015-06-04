class User < ActiveRecord::Base

  attr_accessible :name, :available, :permanent
end