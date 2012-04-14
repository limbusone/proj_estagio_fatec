class RemoveEmpresaIdFromConveniosAndAddConcedenteIdToConvenios < ActiveRecord::Migration
  def up
    remove_column :convenios, :empresa_id
    add_column :convenios, :concedente_id, :integer
  end

  def down
    remove_column :convenios, :concedente_id
    add_column :convenios, :empresa_id, :integer
  end
end
