class User < ApplicationRecord
	validates_uniqueness_of :username
	validates :username, :password, presence: true
end
