require 'csv'

class Task

end


class List

end


class ToDoList

  def show (arr)
    arr.each do |task|
      puts task
    end
  end

end


class Controller

  def initialize
    @todolist = ToDoList.new
  end

  def index
    i = 0
    task_list = []
    list_csv = CSV.read("list.csv")
    list_csv.each do |task|
      task = task[0]
      i += 1
      task = "#{i}. #{task}"
      task_list << task
    end
    @todolist.show(task_list)
  end

end

todolist = ToDoList.new
todolist.index