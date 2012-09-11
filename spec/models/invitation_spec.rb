require 'spec_helper'

describe Invitation do
  it { should belong_to(:classroom) }
  it { should validate_presence_of(:email) }

  before :each do 
  	user = Fabricate(:user)
  	@classroom = user.classrooms.create(:name => "This is a new classroom")
  end

  it "should have a unique invitation Uid set before validation" do
  	invite = @classroom.invitations.new(:email => "bob@lobblah.org")
  	invite.save
  	invite.uid.nil?.should eq(false) 
  end

end
