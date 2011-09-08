require 'spec_helper'

module Quiz
  describe Node do
    let(:output) { double('output').as_null_object }
    let(:node) { Node.new(output) }

    it "should ask if I'm Justin" do
      output.should_receive(:puts).with("Are you Justin?")
      node.ask
    end

    context "answering" do
      context "when a user answers 'no'" do
        it "should say 'You win!'" do
          node.stub!(:gets) { "no\n" }
          node.ask
          output.should_receive(:puts).with("You win!")
        end
      end

      context "when a user answers 'yes'" do
        it "should say 'I win!'" do
          node.ask
          puts "yes\n"
          output.should_receive(:puts).with("I win!")
        end
      end
    end
  end
end
