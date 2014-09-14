module MyApp

  class  Update

    def update_logic(id)
      update_id = id.delete("^0-9").to_i
      unless update_id ==0
      new_values= updated_values(update_id)
      update_file_data(new_values)
      puts "Successfully Updated"
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
        open('storage', 'r') do |f|
          open('storage.tmp', 'w') do |f2|
            f.each_line do |line|
            if should_be_updated(line,val)
              f2.puts(val.join(","))
            else
              f2.puts(line)
            end
           end
          end
        end
        FileUtils.mv 'storage.tmp', 'storage'
    end


    def should_be_updated(line,val)
      l = line.split(",")
      l.first.to_i==val.first.to_i
    rescue
      false
    end


  end

end