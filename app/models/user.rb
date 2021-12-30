class User < ActiveRecord::Base
  has_many :conversation
  has_secure_password
end