require 'csv'

class Task

  attr_accessor :complete, :text

  def initialize(string)
    @complete = false
    @text = string
  end

end


class List

  attr_accessor :todolist

  def initialize
    @todolist = []
    read_csv()
    @csv_file = "list.csv"
  end
  
  def read_csv
    i = 0
    task_list = []
    list_csv = CSV.read("list.csv")
    list_csv.each do |element|
      element = element[0]
      complete = element.slice!(0)
      task = Task.new(element)
      if complete == "t"
        task.complete = true
      else
        task.complete = false
      end
      @todolist << task
    end
  end

  def write_csv
    CSV.open("list.csv", "w") do |csv|
      @todolist.each do |task|
        text = task.text
        complete = bs(task.complete)
        csv << ["#{complete}#{text}"]
      end
    end
  end

  def bs(boolean)
    boolean == true ? "t" : "f"
  end

  def new_task(task)
    @todolist << task
    write_csv()
  end

  def complete_task(num)
    @todolist[num-1].complete = true
    write_csv()
    @todolist[num-1].text
  end

  def delete_task(num)
    confirm = @todolist[num-1]
    @todolist.delete_at(num-1)
    write_csv()
    confirm.text
  end

end