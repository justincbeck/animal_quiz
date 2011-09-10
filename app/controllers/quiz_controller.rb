class QuizController < ApplicationController
  def begin
  end

  def ask
    render :json => { :node_id => "3", :question => "Are you a bear?" }.to_json
  end

  def answer
    logger.info("Response: " + params[:response])
    logger.info("Node ID: " + params[:node_id])
    render :json => { :answer => "I win!" }.to_json
  end
end
