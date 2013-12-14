class AddTypeToSailor < ActiveRecord::Migration
  def change
    add_column :sailors, :type, :string
  end
end
