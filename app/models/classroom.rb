class Classroom < ActiveRecord::Base
	extend FriendlyId
  attr_accessible :name, :owner_id
  friendly_id :uid
  before_create :set_uid

  belongs_to :user, :foreign_key => "owner_id"
  has_many :memberships
  has_many :invitations
  has_many :users, :through => :memberships

  validates_presence_of :name
  validates_presence_of :owner_id
  private
	  def set_uid
	  	self.uid = Digest::MD5.hexdigest("#{self.id}" + "#{self.name}")
	  end
end
