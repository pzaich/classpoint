require 'spec_helper'

describe Classroom do
  it { should belong_to(:user) }
  it { should have_many(:memberships) }
  it { should have_many(:invitations) }
  it { should have_many(:questions) }
  it { should have_many(:members).through(:memberships) }

  it "should validate presence of name field" do
  	classroom = Classroom.new(:owner_id => 1)
  	classroom.save.should eq(false)
  end

  it "should validate presence of owner id" do
  	classroom = Classroom.new(:name => "The sisterhood of travelling pants")
  	classroom.save.should eq(false)
  end
  context "classrooms have a UID & by default are found by this ID" do
    before :each do
      user = Fabricate(:user)
      @classroom1 = user.owned_classrooms.create(:name => "followers")
      @classroom2 = user.owned_classrooms.create(:name => "scumbags")
    end

    it "should have a UID when classroom is saved" do
      (@classroom1.uid == nil).should eq(false)
    end

    it "should create an unique UID for each classroom object" do
      (@classroom1.uid == @classroom2.uid).should eq(false)
    end

    it "#find should search by UID" do
      uid = @classroom1.uid
      (@classroom1 == Classroom.find(uid)).should eq(true)
    end
  end

  context "#retrieve_member" do
    before do
      user = Fabricate(:user)
      @classroom = user.owned_classrooms.create(:name => "followers")
      @user_new = Fabricate(:user)
      @invite = @classroom.invitations.create(:email => @user_new.email)
    end

    it "should add the user object to the classroom if the user belongs to the classroom" do
      Membership.create(:classroom_id => @classroom.id, :user_id => @user_new.id, :invite_uid => @invite.uid)  
      @classroom.retrieve_member(@user_new.email).should eq(@user_new)
    end

    it "should return nil if user with email does not belong to the classroom" do
      @classroom.retrieve_member(@user_new.email).should eq(nil)
    end
  end
end
