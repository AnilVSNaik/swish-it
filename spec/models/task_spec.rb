require 'rails_helper'

RSpec.describe Task, type: :model do
	user = User.first	
	list = List.last
  let(:desc) { 'Buy milk' }
	let(:priority) { 2 }
	let(:is_complete) { false }
	let(:enum) {[:low, :medium, :high, :urgent]}
	let(:task) {Task.create(desc: desc,priority: priority,is_complete: is_complete, user_id:user.id, list_id:list.id)}


	context "validation: " do
		it { is_expected.to validate_presence_of(:desc) }
	end

	context "associations: " do
		it "should belong to user" do
			task = Task.create(desc: "buy milk" ,priority: 2,is_complete: false, user_id:user.id, list_id:list.id)
		  expect(task.user.username).to eq("Username")
		end
	end

	context "creates: " do
		it "takes in valid params and is a proper task" do
			task = Task.create(desc: "Buy milk", priority:  2, list_id: list.id, user_id: user.id, is_complete: false)
			expect(task.desc).to eq("Buy milk")
			expect(task.priority).to eq("high")
		end

		it "won't create an entry if only one valid params is being supplied" do
			Task.create(desc:desc)
			expect( Task.find_by(desc: desc) ).to be nil
		end
	end
end
