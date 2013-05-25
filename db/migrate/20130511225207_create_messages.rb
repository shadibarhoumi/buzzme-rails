class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :likes
      t.references :school
      t.references :target

      t.timestamps
    end
    add_index :messages, :target_id
  end
end
