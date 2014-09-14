module MyApp
  class Create

    def initialize
      @file = File.open("storage","a+")
    end

    def values
      values=[]
      # an unix command to get the last line to avoid the id overrrding
      count= `tail -n 1 storage`
      values<<count.split(",").first.to_i+1
      puts "Please Enter your name:"
      name = gets.chomp
      values<<name
      puts "Please Enter your email Address:"
      address = gets.chomp
      values<<address
    end

    def store_values(val)
      if val.kind_of?(Array)
           @file.puts(val.join(","))
           @file.close
      end
        puts "the information is saved sucessfully"  if @file.closed?
    end


  end
end