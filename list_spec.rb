require "rspec"

require_relative "list"
require_relative "task"

describe List do
  # Your specs here
  # rspec on def initialize's arguments
  let(:title) 	{ "Buy food" }
  let(:tasks) 	{ [Task.new("chicken")] }
  let(:list) 	{ List.new(title, tasks) }

  describe "#initiialize" do
  	it "takes a title for its first argument and tasks which will be in an array as its second argument" do
  		expect(List.new("Buy fruits", "apple")).to be_a_kind_of(List)
  	end

 		it "requires two arguments" do
  		expect { List.new }.to raise_error(ArgumentError)
  	end
	end

	# rspec on @title
  describe "#title" do
    it "returns the correct title for the list" do
      expect(list.title).to eq title
    end
  end

  # rspec on @tasks
  describe "#tasks" do
    it "returns correct tasks in an array for the list" do
      expect(list.tasks).to eq tasks
    end
  end

	describe "#add_task"  do
 		it "requires one argument" do
  		expect { list.add_task }.to raise_error(ArgumentError)
  	end

  	it "count in tasks array increases by 1" do
  		list.add_task(Task.new("apple"))
			expect(list.tasks.count).to be 2
		end
	end

	describe ".tasks" do
		it "pushes single task into an array" do
			list.add_task(Task.new("apple"))
			expect(tasks).to eq tasks
		end
	end

	describe "#complete_task" do
		it "returns true if index argument is valid, false if invalid input" do
			expect(list.complete_task(2)).to be_falsey
			# be_falsey returns false when argument is nil or false
		end

		it "requires one argument" do
  		expect { list.complete_task }.to raise_error(ArgumentError)
  	end
 	end

 	describe "#delete_task" do
 		it "Reduces tasks' count by one" do
 			## method 1:
 			list.delete_task(0)
 			expect(list.tasks.count).to be 0

 			## method 2:
 			# use {} to stimulate the action. otherwise () will makes action proceed immediately 
 			# expect{ list.delete_task(0) }.to change{ list.tasks.count }.from(1).to(0)
 		end

		it "requires one index argument" do
  		expect { list.complete_task }.to raise_error(ArgumentError)
  	end
 	end

 	describe "#completed_tasks" do
 		it "changes @complete status of an object in TaskClass to true and increases the count" do
 			list.complete_task(0)
 			expect(list.completed_tasks.count).to be 1
 		end
 	end

 	describe "#incompleted_tasks" do
 	 		## method 1: Not a good test
 		# it "shows array of incomplete tasks' objects" do
 			# expect(list).to eq list

 			## method 2
 		it "shows array of incomplete tasks' object" do
 			list.add_task(Task.new("apple"))
 			expect(list.incomplete_tasks.count).to be 2
 		end
 	end
end