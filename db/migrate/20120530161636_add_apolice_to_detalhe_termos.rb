class AddApoliceToDetalheTermos < ActiveRecord::Migration
  def change
    add_column :detalhe_termos, :apolice, :string
  end
end
