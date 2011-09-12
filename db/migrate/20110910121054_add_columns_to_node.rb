class AddColumnsToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :parent_id, :integer
    add_column :nodes, :no_id, :integer
    add_column :nodes, :yes_id, :integer
    add_column :nodes, :root, :boolean, :null => false, :default => false
    add_column :nodes, :animal, :string
    add_column :nodes, :question, :string
    add_column :nodes, :answer, :string
  end
end
