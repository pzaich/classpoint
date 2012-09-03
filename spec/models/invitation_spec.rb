require 'spec_helper'

describe Invitation do
  it { should belong_to(:classroom) }
  it { should validate_presence_of(:email) }

  before :each do 
  	user = Fabricate(:user)
  	@classroom = user.classrooms.create(:name => "This is a new classroom")
  end

  it "should validate uniqueness of email address w/ classroom" do
  	invitation1 = @classroom.invitations.new(:email => "test@example.com")
  	invitation1.save
  	invitation2 = @classroom.invitations.new(:email => "TEst@example.com")
  	invitation2.save.should eq(false)
  end
end
