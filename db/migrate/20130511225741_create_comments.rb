class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :message

      t.timestamps
    end
    add_index :comments, :message_id
  end
end
