class AddTypeToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :type, :string
  end
end
