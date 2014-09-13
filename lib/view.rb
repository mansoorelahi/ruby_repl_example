module MyApp

  class  View

    def initialize
      @file = File.open("storage","r")
    end

    def view_content
      puts "The stored values are listed below:\n\n"
      puts "Id,Name,Email\n\n"
      @file.each_line do |line|
        puts  line
      end
    end

  end

end