module MyApp

  class  Update

    def initialize
      @file = File.open("storage","r+")
    end

    def update_logic(id)
      update_id = id.delete("^0-9").to_i
      puts update_id
      new_values= updated_values(update_id)
      puts new_values.join(",")
      update_file_data(new_values)
    end

    def updated_values(id)
      values=[]
      values << id
      puts "Please update the name:"
      name = gets.chomp
      values<<name
      puts "Please update email Address:"
      address = gets.chomp
      values<<address
    end

    def update_file_data(val)
      @file.each do |line|
        if should_be_updated(line,val)
          puts "I am in "
          @file.seek(-line.length, IO::SEEK_CUR)
          # overwrite line with spaces and add a newline char
          @file.write(' ' * (line.length - 1))
          @file.write(val.join(","))
        end
      end
      @file.close
      puts "updated successfully"
    end


    def should_be_updated(line,val)
      l = line.split(",")
      l.first.to_i==val.first.to_i

    end


  end

end