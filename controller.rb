require_relative 'view'
require_relative 'model'

class Controller

  def initialize
    @command = ARGV
    @list = List.new
    @view = View.new
    menu()
  end

  def menu
    commands = ["add", "complete", "delete", "index"]
    method = @command[0]
    if commands.include? method
      case method
        when "add"
          @command.shift
          text = @command.join(" ")
          add(text)
          @view.add_message(text)
          index()
        when "delete"
          to_delete = @command[1].to_i
          check = check_number(to_delete)
          if check == true
            @view.delete_message(delete(to_delete))
            index()
          else
            index()
            @view.error
          end
        when "index"
          index()
        when "complete"
          to_complete = @command[1].to_i
          check = check_number(to_complete)
          if check == true
            @view.complete_message(complete(to_complete))
            index()
          else
            index()
            @view.error
          end
      end
    else
      @view.error
    end
  end

  def index
    @view.show(@list.todolist)
  end

  def add(string)
    task = Task.new(string)
    @list.new_task(task)
  end

  def delete(to_delete)
    confirm = @list.delete_task(to_delete)
  end

  def complete(to_complete)
    confirm = @list.complete_task(to_complete)
  end

  def check_number(num)
    length = @list.todolist.length
    check = num <= length ? true : false
  end

end

todo = Controller.new