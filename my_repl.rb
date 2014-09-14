require File.join(File.dirname(__FILE__), '', 'my_app')
class MyRepl
  include MyApp

  loop do
    puts "\n\nEnter Your Command Here"
    input = gets.chomp
    command, *params = input.split /\s/

    case command
      when /\Ahelp\z/i
        MyApp.show_command_list
      when /\Acreate\z/i
        data  = Create.new
        values= data.values
        data.store_values(values)
      when /\Aupdate\z/i
        view= View.new
        view.view_content
        puts "Type In the ID of record which you would like to update"
        input = gets.chomp
        update=Update.new
        update.update_logic(input)
      when /\Aview\z/i
         view= View.new
         view.view_content
      when /\Adelete\z/i
        del= Delete.new
        del.delete_val
      when /\Aexit\z/i
       break
      else
        puts 'Invalid command type help to see the supported commands'
    end
  end


end