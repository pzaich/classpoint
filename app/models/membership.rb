class Membership < ActiveRecord::Base
	attr_accessible :user_id, :classroom_id

	belongs_to :user
	belongs_to :classroom

	validates_presence_of :user
	validates_presence_of :classroom

	validates_uniqueness_of :user_id, :scope => :classroom_id

end
