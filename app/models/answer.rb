class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id, :user_id
  belongs_to :user
  belongs_to :question
  validates_presence_of :body, :user, :question
	validates_uniqueness_of :user_id, :scope => :question_id
end
