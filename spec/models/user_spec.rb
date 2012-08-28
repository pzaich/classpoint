require 'spec_helper'

describe User do
	let(:user) { Fabricate(:user) }

	it { should have_many(:classrooms) }
end