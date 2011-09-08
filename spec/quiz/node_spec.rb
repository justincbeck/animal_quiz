require 'spec_helper'

module Quiz
  describe Node do
    let(:output) { double('output').as_null_object }

    context "asking" do
      it "should ask if I'm Justin" do
        node = Node.new(output)
        output.should_receive(:puts).with("Are you Justin?")
        node.ask
      end
    end

    context "answering" do
      context "when a user answers 'no'" do
        it "should say 'You win!'" do
          node = Node.new(output)
          node.stub!(:gets) { "no\n" }
          output.should_receive(:puts).with("You win!")
          node.ask
        end
      end

      context "when a user answers 'yes'" do
        it "should say 'I win!'" do
          node = Node.new(output)
          node.stub!(:gets) { "yes\n" }
          output.should_receive(:puts).with("I win!")
          node.ask
        end
      end
    end
  end
end
