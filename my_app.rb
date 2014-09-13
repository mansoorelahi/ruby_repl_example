Dir[File.join(__dir__, 'lib', '*.rb')].each {|file| require file }

module MyApp



  def self.show_command_list
    puts "\thelp -- Shows list of supported commands
           create -- Creates New Record
           update -- Updates the record
           view   -- displays the record
           delete -- deletes the selected record
           exit   -- exits the programme   "
  end







end