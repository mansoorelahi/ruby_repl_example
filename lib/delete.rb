module MyApp

  class Delete

    def initialize
      @file = File.open("storage","r+")
    rescue
      @file = File.new("storage")
      @file= File.open("storage","r+")
    end


    def delete_file_data(id)
      @file.each do |line|
        if should_be_deleted(line,id)
          # seek back to the beginning of the line.
          @file.seek(-line.length, IO::SEEK_CUR)
          # overwrite line with spaces and add a newline char
          @file.write(' ' * (line.length - 1))
          @file.write("\n")
        end
      end
      @file.close
    end


    def should_be_deleted(line,id)
      l = line.split(",")
      l.first.to_i==id
     rescue
      false
    end

    def delete_val
      view= View.new
      view.view_content
      puts "\n\nPut in the ID  value which you wanna delete "
      input = gets.chomp.delete("^0-9").to_i
      unless input==0
        puts "Are you sure you want to delete the record with ID #{input} answer with yes or no "
        confirm=gets.chomp
        if confirm =="yes"
          delete_file_data(input)
          puts "Sucessfully deleted"
        end
      else
        puts "Invalid  Id"
      end
    end


  end

end