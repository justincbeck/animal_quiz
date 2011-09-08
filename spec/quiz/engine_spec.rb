require 'spec_helper'

module Quiz
  describe Engine do
    let(:output) { double('output').as_null_object }

    it "start quiz" do
      engine = Engine.new(output)
      root = Node.new(output)
      root.animal = true
      root.question = "Are you a bear?"
      engine.root = root
      output.should_receive(:puts).with("Think of an animal...")
      engine.start_quiz
    end
  end
end
