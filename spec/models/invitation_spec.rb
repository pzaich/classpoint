require 'spec_helper'

describe Invitation do
  it { should belong_to(:classroom) }
  it { should validate_presence_of(:email) }

  before :each do 
  	user = Fabricate(:user)
  	@classroom = user.classrooms.create(:name => "This is a new classroom")
  end

end
