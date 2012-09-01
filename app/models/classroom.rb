class Classroom < ActiveRecord::Base
  attr_accessible :name, :owner_id
  belongs_to :user, :foreign_key => "owner_id"

  validates_presence_of :name
  validates_presence_of :owner_id
end
