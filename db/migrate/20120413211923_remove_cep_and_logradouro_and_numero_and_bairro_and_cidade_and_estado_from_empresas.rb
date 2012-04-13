class RemoveCepAndLogradouroAndNumeroAndBairroAndCidadeAndEstadoFromEmpresas < ActiveRecord::Migration
  def up
    remove_column :empresas, :cep
    remove_column :empresas, :logradouro
    remove_column :empresas, :numero
    remove_column :empresas, :bairro
    remove_column :empresas, :cidade
    remove_column :empresas, :estado
  end

  def down
    add_column :empresas, :estado, :string
    add_column :empresas, :cidade, :string
    add_column :empresas, :bairro, :string
    add_column :empresas, :numero, :string
    add_column :empresas, :logradouro, :string
    add_column :empresas, :cep, :string
  end
end
