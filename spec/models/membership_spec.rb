require 'spec_helper'

describe Membership do
  it should { belong_to(:user) }
  it should { belong_to(:classroom) }

  let(:user) { Fabricate(:user) }

  before :each do 
  	@classroom = user.owned_classrooms.create(:name => "This is a new classroom")
  end

  after :each do
  	@classroom.destroy
  end

  it "should validate the presence of a real user" do
  	membership = Membership.new(:user_id => 247, :classroom_id => @classroom )
  	membership.save.should eq(false)
  end

  it "should validate the presence of a real classroom" do
  	membership = Membership.new(:user_id => user, :classroom_id => 4930)
  	membership.save.should eq(false)
  end

  it "should validate the uniqueness of the membership relationship" do
  	membership = Membership.create(:user_id => user.id, :classroom_id => @classroom.id)
  	membership = Membership.new(:user_id => user.id, :classroom_id => @classroom.id)
		membership.save.should eq(false)  
  end
end
