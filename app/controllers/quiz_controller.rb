class QuizController < ApplicationController
  def begin
  end

  def ask
    node = !params[:node].nil? ? Node.find(params[:node]) : Node.find_by_root(true)
    render :json => {:node_id => node.id, :question => node.question}.to_json
  end

  def answer
    node = !params[:node].nil? ? Node.find(params[:node]) : Node.find_by_root(true)
    if params[:response].eql? "y"
      if node.yes.nil?
        render :json => {:answer => "I win!", :winner => false}.to_json
      else
        redirect_to :ask, :params => {:node => node.id}
      end
    else
      if node.no.nil?
        render :json => {:answer => "You win!", :winner => true}.to_json
      else
        redirect_to :ask, :params => {:node => node.id}
      end
    end
  end
end
