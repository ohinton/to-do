require('spec_helper')

describe(Task) do

  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-08-12 00:00:00'})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

    describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

    describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-08-12 00:00:00'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-08-12 00:00:00'})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description and list ID") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-08-12 00:00:00'})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-09-12 00:00:00'})
      expect(task1).to(eq(task2))
    end
  end

  describe('.sort_by_date_ascending') do
    it('returns a list of the tasks in ascending order based on their due dates') do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2016-08-12 00:00:00'})
      task1.save()
      task2 = Task.new({:description => "learn Ruby", :list_id => 1, :due_date => '2016-08-01 00:00:00'})
      task2.save()
      expect(Task.sort_by_date_ascending()).to(eq([task2, task1]))

    end
  end

end
