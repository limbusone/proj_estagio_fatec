class RemoveIndexEmpresaIdFromConvenios < ActiveRecord::Migration
  def up
    remove_index :convenios, :column => :empresa_id
  end

  def down
    add_index :convenios, :empresa_id
  end
end
