class Classroom < ActiveRecord::Base
  attr_accessible :name, :owner_id
  before_create :randomize_id

  belongs_to :user, :foreign_key => "owner_id"
  has_many :memberships
  has_many :users, :through => :memberships

  validates_presence_of :name
  validates_presence_of :owner_id

  def set_uid
  	self.uid = Digest::MD5.hexdigest("#{self.id}" + "#{self.name}")
  end
end
