class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  before_create :generate_username
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :owned_classrooms, :class_name => "Classroom", :foreign_key => "owner_id"
  has_many :memberships
  has_many :classrooms, :through => :memberships

  private
    def generate_username
      self.username = self.email.split('@')[0]
    end
end
