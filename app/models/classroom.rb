class Classroom < ActiveRecord::Base
  attr_accessible :name, :owner_id
end
