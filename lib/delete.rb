require 'fileutils'

module MyApp

  class Delete

    def delete_file_data(id)
      open('storage', 'r') do |f|
        open('storage.tmp', 'w') do |f2|
          f.each_line do |line|
            f2.write(line) unless should_be_deleted(line,id)
          end
        end
      end
      FileUtils.mv 'storage.tmp', 'storage'
    end

    def should_be_deleted(line,id)
      l = line.split(",")
      l.first.to_i==id
     rescue
      true
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