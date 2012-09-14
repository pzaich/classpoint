class Classroom < ActiveRecord::Base
	extend FriendlyId
  attr_accessible :name, :owner_id
  friendly_id :uid
  before_create :set_uid
  belongs_to :user, :foreign_key => "owner_id"
  has_many :memberships
  has_many :invitations
  has_many :questions
  has_many :users, :through => :memberships

  validates_presence_of :name
  validates_presence_of :owner_id

  def retrieve_member(email)
    self.users.find_by_email(email)
  end

  private
	  def set_uid
      self.uid = SecureRandom.uuid
	  end
end
