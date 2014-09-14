module MyApp

  class  Update

    def initialize
      @file = File.open("storage","r+")
    end

    def update_logic(id)
      update_id = id.delete("^0-9").to_i
      unless update_id ==0
      new_values= updated_values(update_id)
      update_file_data(new_values)
      else
        puts "Invalid selection"
      end
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
          File.write(f = "storage", File.read(f).gsub(line,val.join(",")))
          break
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