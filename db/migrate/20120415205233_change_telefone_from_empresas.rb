class ChangeTelefoneFromEmpresas < ActiveRecord::Migration
  def up
    change_column :empresas, :telefone, :string, :limit => 255
  end

  def down
    change_column :empresas, :telefone, :string, :limit => 14
  end
end
