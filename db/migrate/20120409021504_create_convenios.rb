class CreateConvenios < ActiveRecord::Migration
	def change
		create_table :convenios do |t|
			t.integer :empresa_id, :null => false, :unique => true
			t.integer :interveniente_id, :null => false
			t.integer :vigencia
			t.boolean :rescidido, :default => false
			t.timestamps
		end
        add_index :convenios, :empresa_id
	end
end
