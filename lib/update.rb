module MyApp

  class  Update

    def initialize
      @file = File.open("storage","r+")
    end

    def update_file_data
      puts "The stored values are listed below:\n\n"
      puts "Id,Name,Email\n\n"
      @file.each_line do |line|
        puts  line
      end
    end

  end

end