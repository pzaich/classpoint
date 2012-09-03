require 'spec_helper'

describe User do
	let(:user) { Fabricate(:user) }

	it { should have_many(:owned_classrooms) }
	it { should have_many(:memberships) }
	it { should have_many(:classrooms).through(:memberships) }
end