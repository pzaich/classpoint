class Classroom < ActiveRecord::Base
  attr_accessible :name, :owner_id

  belongs_to :user, :foreign_key => "owner_id"
  has_many :memberships
  has_many :users, :through => :memberships

  validates_presence_of :name
  validates_presence_of :owner_id
end
