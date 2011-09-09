require 'spec_helper'

describe QuizController do

  describe "GET 'begin'" do
    it "should be successful" do
      get 'begin'
      response.should be_success
    end
  end

end
