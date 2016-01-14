require 'colorize'
class View

  def show(arr)
    pantalla_dinamica()
    i = 0
    arr.each do |task|
      text = task.text
      i += 1
      complete = ["[ ]","[X]"]
      if task.complete == false
        j = 0
      else
        j = 1
      end
      text = "#{i}. #{complete[j]} #{text}"
      puts text
    end
    puts
  end

  def add_message(text)
    puts "\nAgregaste la tarea: " + "\"#{text}\"".colorize(:green) + " a tu lista\n\n"
  end

  def delete_message(text)
    puts "\nEliminaste la tarea: " + "\"#{text}\"".colorize(:red) + " de tu lista\n\n"
  end

  def complete_message(text)
    puts "\nCompletaste la tarea: " + "\"#{text}\"\n\n".colorize(:cyan)
  end

  def error
    puts "\nNO SE RECIBIÓ UN COMANDO O NÚMERO CORRECTO\n"
  end

  def pantalla_dinamica
    clear_screen!()
    move_to_home!()
    reputs()
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_to_home!
    print "\e[H"
  end

  def reputs(str = '')
    puts "\e[0K" + str
  end

end