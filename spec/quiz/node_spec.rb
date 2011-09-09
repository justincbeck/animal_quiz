require 'spec_helper'

module Quiz
  describe Node do
    let(:output) { double('output').as_null_object }

    context "with no children" do
      before(:each) do
        @node = Node.new(output)
        @node.question = "Are you a bear?"
        @node.animal = "bear"
        @node.root = @node
        @node.parent = @node
      end

      context "asking" do
        it "should ask if I'm a bear" do
          output.should_receive(:puts).with("Are you a bear?")
          @node.ask
        end
      end

      context "answering" do
        context "when a user answers 'no'" do
          it "should say 'You win!'" do
            output.should_receive(:puts).with("You win! Help me learn from my mistake before you go...")
            @node.stub!(:gets).and_return('no')
            @node.ask
          end
        end

        context "when a user answers 'yes'" do
          it "should say 'I win!'" do
            output.should_receive(:puts).with("I win!")
            @node.stub!(:gets).and_return('yes', 'no')
            @node.ask
          end
        end
      end
    end

    context "with children but no other descendants" do
      before(:each) do
        @root = Node.new(output)
        @root.question = "Are you a reptile?"

        @no = Node.new(output)
        @no.question = "Are you a bear?"
        @no.animal = "bear"
        @no.root = @root
        @no.parent = @root

        @yes = Node.new(output)
        @yes.question = "Are you a lizard?"
        @yes.animal = "lizard"
        @yes.root = @root
        @yes.parent = @root

        @root.no = @no
        @root.yes = @yes
      end

      context "asking" do
        it "should ask if I'm a reptile" do
          output.should_receive(:puts).with("Are you a reptile?")
          @root.ask
        end
      end

      context "answering" do
        context "when a user answers 'no'" do
          it "should ask if I'm a bear" do
            output.should_receive(:puts).with("Are you a bear?")
            @root.stub!(:gets).and_return('no')
            @root.ask
          end
        end

        context "when a user answers 'yes" do
          it "should ask if I'm a lizard" do
            output.should_receive(:puts).with("Are you a lizard?")
            @root.stub!(:gets).and_return('yes', 'no')
            @root.ask
          end
        end
      end
    end
  end
end
