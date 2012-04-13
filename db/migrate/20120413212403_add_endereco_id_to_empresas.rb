class AddEnderecoIdToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :endereco_id, :integer
  end
end
