class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome, :limit => 50, :null => false
      t.string :cnpj, :limit => 14, :null => false
      t.string :telefone, :limit => 14
      t.string :email, :limit => 74
      t.string :cep, :limit => 8
      t.string :logradouro, :limit => 100
      t.integer :numero
      t.string :bairro, :limit => 50
      t.string :cidade, :limit => 50
      t.string :estado, :limit => 2
      t.timestamps
    end
  end
end
