module Quiz
  class Node
    attr_accessor :root, :parent, :yes, :no, :animal, :question, :answer

    def initialize(output)
      @output = output
    end

    def ask
      @output.puts @question
      @answer = gets.chomp
      case @answer
        when "yes" then
          do_yes
        when "no" then
          do_no
      end

    end

    private

    def do_yes
      if @yes.nil?
        @output.puts "I win!"
        play_again
      else
        @yes.ask
      end
    end

    def do_no
      if @no.nil?
        @output.puts "You win! Help me learn from my mistake before you go..."
        teach_me

        @output.puts "Thanks!"
        play_again
      else
        @no.ask
      end
    end

    def play_again
      @output.puts "Play again? (yes or no)"
      again = gets.chomp
      if again.eql?("yes")
        if @root.nil?
          ask
        else
          @root.ask
        end
      else
        @output.puts "Goodbye!"
      end
    end

    def teach_me
      @output.puts "What animal are you thinking of?"
      animal = gets.chomp
      @output.puts "Give me a question to distinguish a #{@animal} from a #{animal}."
      question = gets.chomp
      @output.puts "For #{animal} what is the answer to your question? (yes or no)"
      answer = gets.chomp

      insert_new_node animal, question, answer
    end

    def insert_new_node animal, question, answer
      new_parent = construct_new_parent question
      new_animal = construct_new_animal animal, new_parent

      assign_to_new_parent new_parent, new_animal, answer

      if @root == self
        @root = new_parent
      end

      new_parent.root = @root
      new_animal.root = @root

      insert_into_tree new_parent
    end

    def construct_new_parent question
      new_parent = Node.new(@output)
      new_parent.question = question
      new_parent
    end

    def construct_new_animal animal, new_parent
      new_animal = Node.new(@output)
      new_animal.question = "Are you a #{animal}?"
      new_animal.animal = animal
      new_animal.parent = new_parent
      new_animal
    end

    def assign_to_new_parent new_parent, new_animal, answer
      if answer.eql? "yes"
        new_parent.no = self
        new_parent.yes = new_animal
      else
        new_parent.yes = self
        new_parent.no = new_animal
      end
    end

    def insert_into_tree new_parent
      if @parent == self
        @parent = new_parent
      else
        if @parent.answer.eql? "no"
          @parent.no = new_parent
        else
          @parent.yes = new_parent
        end

        new_parent.parent = @parent
        @parent = new_parent
      end
    end
  end
end
