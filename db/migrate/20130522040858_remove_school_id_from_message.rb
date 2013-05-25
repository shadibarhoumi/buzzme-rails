class RemoveSchoolIdFromMessage < ActiveRecord::Migration
  def change
	change_table :messages do |t|
		remove_column :messages, :school_id
	end
  end
end
