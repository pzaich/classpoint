class Question < ActiveRecord::Base
  attr_accessible :classroom_id, :detail, :title, :user_id, :views

  belongs_to :user
  belongs_to :classroom
  has_many :answers
  validates_presence_of :title, :user, :classroom
end
