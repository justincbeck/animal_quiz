module Quiz
  class Engine
    attr_accessor :root

    def initialize output
      @output = output
    end

    def start_quiz
      @output.puts "Think of an animal..."
      @root.ask
    end
  end
end

