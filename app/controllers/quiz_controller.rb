class QuizController < ApplicationController
  def begin
    root = generate_seed

    root.ask
  end

  private

  def generate_seed
    root = Node.new($stdout)
    root.animal = "bear"
    root.question = "Are you a #{root.animal}?"
    root.root = root
    root.parent = root
  end
end
