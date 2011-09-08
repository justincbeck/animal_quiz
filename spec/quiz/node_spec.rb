require 'spec_helper'

module Quiz
  describe Node do
    let(:output) { double('output').as_null_object }

    context "asking" do
      it "should ask if I'm a bear" do
        node = Node.new(output)
        node.question = "Are you a bear?"
        output.should_receive(:puts).with("Are you a bear?")
        node.ask
      end
    end

    context "answering" do
      context "when a user answers 'no'" do
        it "should say 'You win!'" do
          node = Node.new(output)
          node.animal = "bear"
          node.question = "Are you a bear?"
          node.stub!(:gets) { "no\n" }
          output.should_receive(:puts).with("You win! Help me learn from my mistake before you go...")
          node.ask
        end
      end

      context "when a user answers 'yes'" do
        it "should say 'I win!'" do
          node = Node.new(output)
          node.question = "Are you a bear?"
          node.stub!(:gets) { "yes\n" }
          node.animal = "bear"
          output.should_receive(:puts).with("I win!")
          node.ask
        end
      end
    end
  end
end
