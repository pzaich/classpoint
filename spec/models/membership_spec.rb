require 'spec_helper'

describe Membership do
  it should { belong_to(:user) }
  it should { belong_to(:classroom) }

  let(:user) { Fabricate(:user) }

  before :each do 
  	@classroom = user.owned_classrooms.create(:name => "This is a new classroom")
    @invite = @classroom.invitations.create(:email => "tester@test.com")
  end



  it "should validate the presence of a real user" do
  	membership = Membership.new(:user_id => 247, :classroom_id => @classroom.id, :invite_uid => @invite.uid )
  	membership.save.should eq(false)
  end

  it "should validate the presence of a real classroom" do
  	membership = Membership.new(:user_id => user.id, :classroom_id => 45655, :invite_uid => @invite.uid)
  	membership.save.should eq(false)
  end

  it "should validate the uniqueness of the membership relationship" do
  	membership = Membership.create(:user_id => user.id, :classroom_id => @classroom.id, :invite_uid => @invite.uid)
  	membership = Membership.new(:user_id => user.id, :classroom_id => @classroom.id, :invite_uid => @invite.uid)
		membership.save.should eq(false)
  end

  it "should validate the presence of a UID inputted at creation" do 
    membership = Membership.new(:user_id => user.id, :classroom_id => @classroom.id)
    membership.save.should eq(false)  
    membership = Membership.new(:user_id => user.id, :classroom_id => @classroom.id, :invite_uid => @invite.uid)
    membership.save.should eq(true)
  end

  context "should only create a membership if an invite exists" do
    it "should not create a membership if invite uid is not found" do
      membership = Membership.new(:user_id => user.id, :classroom_id => @classroom.id, :invite_uid => "ABCDIDKEDISOKELDK1")
      membership.save.should eq(false)
    end

    it "should create a membership if the invite uid is found under the classroom" do
      membership = Membership.new(:user_id => user.id, :classroom_id => @classroom.id, :invite_uid => @invite.uid)
      membership.save.should eq(true)
    end
  end
end
