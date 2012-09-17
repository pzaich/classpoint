require 'spec_helper'

describe User do
	let(:user) { Fabricate(:user) }

	it { should have_many(:owned_classrooms) }
	it { should have_many(:memberships) }
	it { should have_many(:questions) }
	it { should have_many(:classrooms).through(:memberships) }
	it { should have_many(:answers)}

	it "should generate a username from the email of the user when user is created" do
		user.username.should eq(user.email.split('@')[0])
	end
end