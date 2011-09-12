class QuizController < ApplicationController
  def begin
    # This space intentionally left blank
  end

  def ask
    node = !params[:node_id].nil? ? Node.find(params[:node_id]) : Node.find_by_root(true)
    render :json => {:node_id => node.id, :question => node.question}.to_json
  end

  def answer
    node = !params[:node_id].nil? ? Node.find(params[:node_id]) : Node.find_by_root(true)
    node.answer = params[:response]
    node.save

    if params[:response].eql? "y"
      if node.yes.nil?
        render :json => {:c_winner => true}.to_json
      else
        yes = node.yes
        render :json => {:node_id => yes.id, :question => yes.question}.to_json
      end
    else
      if node.no.nil?
        render :json => {:p_winner => true, :animal => node.animal }.to_json
      else
        no = node.no
        render :json => {:node_id => no.id, :question => no.question}.to_json
      end
    end
  end

  def new_node
    node = Node.find(params[:parent])
    if !params[:animal].blank? and !params[:question].blank?
      node.insert_new_node params[:animal], params[:question], params[:answer]
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end
end
