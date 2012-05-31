class AddResponsavelNomeToTces < ActiveRecord::Migration
  def change
    add_column :tces, :responsavel_nome, :string
  end
end
