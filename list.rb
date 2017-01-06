require_relative "task"

class List
  attr_reader :title, :tasks

  def initialize(title, tasks = [])
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    tasks << task
  end

  # def complete_task(index)
  #   tasks[index].complete!
  # end

  def complete_task(index)
    return false unless tasks[index]
    if tasks[index].complete!
      return true
    end
  end

  def delete_task(index)
    tasks.delete_at(index)
  end

  def completed_tasks
    tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete? }
  end
end

# x = List.new("My list", [Task.new("chicken")])

# p x.add_task(Task.new("apple"))

# # p x.add_task(Task.new("apple")).class
# p x.incomplete_tasks


