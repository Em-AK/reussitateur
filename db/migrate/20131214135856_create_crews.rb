class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
