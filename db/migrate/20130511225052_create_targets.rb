class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name
      t.references :school

      t.timestamps
    end
    add_index :targets, :school_id
  end
end
