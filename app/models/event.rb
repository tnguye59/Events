class Event < ActiveRecord::Base
	has_many :attends
	has_many :comments
	belongs_to :user
end
