require 'spec_helper'

describe Question do
	it { should belong_to(:user) }
	it { should belong_to(:classroom) }
	it { should have_many(:answers) }
	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:user) }
	it { should validate_presence_of(:classroom) }
end
