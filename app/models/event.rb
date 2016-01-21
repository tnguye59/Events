class Event < ActiveRecord::Base
	has_many :attends
	has_many :comments
	has_many :users, through: :attends
	belongs_to :user

	def self_attend(id)
		self.attends.pluck(:user_id).include?(id)
	end
end
