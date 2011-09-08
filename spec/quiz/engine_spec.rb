require 'spec_helper'

module Quiz
  describe Engine do
    let(:output) { double('output').as_null_object }
    let(:engine) { Engine.new(output) }

    it "should do something" do
      lambda { engine.start_quiz }.should raise_error
    end
  end
end
