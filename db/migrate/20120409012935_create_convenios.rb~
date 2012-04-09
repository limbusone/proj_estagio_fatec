class CreateConvenios < ActiveRecord::Migration
	def change
		drop_table :convenios
		create_table :convenios do |t|
			t.integer :empresa_id, :null => false, :unique => true
			t.integer :interveniente_id, :null => false
			t.integer :vigencia
			t.boolean :rescidido, :default => false
			t.timestamps
		end
		execute <<-COCO
			ALTER TABLE convenios
				ADD CONSTRAINT fk_convenios_empresas
				FOREIGN KEY (empresa_id)
				REFERENCES empresas(id)
		COCO
		execute <<-CACA
			ALTER TABLE convenios
				ADD CONSTRAINT fk_convenios_intervenientes
				FOREIGN KEY (interveniente_id)
				REFERENCES intervenientes(id)
		CACA
	end
end
