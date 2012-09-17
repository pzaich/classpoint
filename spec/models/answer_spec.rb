require 'spec_helper'

describe Answer do
	it { should validate_presence_of(:body) }
	it { should validate_presence_of(:user) }
	it { should validate_presence_of(:question) }
	it { should belong_to(:user) }
	it { should belong_to(:question) }

	let(:user) { Fabricate(:user) }

	before do
		@classroom = user.owned_classrooms.create(:name => "sample classroom")
		@question =  Fabricate(:question, :user => user, :classroom => @classroom)
	end

	it "should validate that only one answer can be given per user per question" do
		answer = @question.answers.create(:body => "This is a response to the question.", :user_id => user.id )
		answer_duplicate = @question.answers.create(:body => "This is a response to the question.", :user_id => user.id )
		answer_duplicate.save.should eq(false)
	end
end
