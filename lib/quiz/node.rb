module Quiz
  class Node
    attr_accessor :yes, :no

    def initialize(output)
      @output = output
    end

    def ask
      @output.puts "Are you Justin?"
      answer = gets.chomp
      case answer
        when "yes" then
          @output.puts "I win!"
        when "no" then
          @output.puts "You win!"
      end

    end
  end
end
