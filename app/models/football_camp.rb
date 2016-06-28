class FootballCamp < ActiveRecord::Base
	belongs_to :user
	serialize :offensive_position, Array
	serialize :defensive_position, Array
end
