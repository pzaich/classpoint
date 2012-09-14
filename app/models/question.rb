class Question < ActiveRecord::Base
  attr_accessible :classroom_id, :detail, :title, :user_id, :views
end
