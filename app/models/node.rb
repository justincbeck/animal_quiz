class Node < ActiveRecord::Base
  belongs_to :no, :class_name => "Node"
  belongs_to :yes, :class_name => "Node"
  belongs_to :parent, :class_name => "Node"

  attr_accessor :answer

  def insert_new_node animal, question, answer
    new_parent = Node.create({:question => question})
    new_animal = Node.create({:question => "Are you a #{animal}", :animal => animal, :parent => new_parent})

    assign_to_new_parent new_parent, new_animal, answer

    if self.root
      new_parent.root = true
      new_parent.save
      self.root = false
      self.save
    end

    insert_into_tree new_parent
  end

  def assign_to_new_parent new_parent, new_animal, answer
    if answer.eql? "yes"
      new_parent.no = self
      new_parent.yes = new_animal
    else
      new_parent.yes = self
      new_parent.no = new_animal
    end
    new_parent.save
  end

  def insert_into_tree new_parent
    logger.info "Parent: " + self.parent.to_json
    if !self.parent.nil?
      logger.info "Parent (answer): " + self.parent.answer.to_s
      if self.parent.answer.eql? "no"
        self.parent.no = new_parent
      else
        self.parent.yes = new_parent
      end
    end

    new_parent.parent = self.parent
    new_parent.save

    self.parent = new_parent
    self.save
  end
end
