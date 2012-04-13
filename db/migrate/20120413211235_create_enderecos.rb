class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :logradouro
      t.integer :numero
      t.string :bairro
      t.string :cidade
      t.string :estado

      t.timestamps
    end
  end
end
