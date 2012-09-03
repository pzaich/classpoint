require 'spec_helper'

describe Classroom do
  it { should belong_to(:user) }
  it { should have_many(:memberships) }
  it { should have_many(:users).through(:memberships) }

  it "should validate presence of name field" do
  	classroom = Classroom.new(:owner_id => 1)
  	classroom.save.should eq(false)
  end

  it "should validate presence of owner id" do
  	classroom = Classroom.new(:name => "The sisterhood of travelling pants")
  	classroom.save.should eq(false)
  end
end
