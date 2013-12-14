class CreateCrewsSailorsJoinTable < ActiveRecord::Migration
  def change
    create_table :crews_sailors do |t|
      t.belongs_to :crew
      t.belongs_to :sailor
    end
  end
end
