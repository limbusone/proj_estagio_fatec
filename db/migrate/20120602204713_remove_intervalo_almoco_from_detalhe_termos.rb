class RemoveIntervaloAlmocoFromDetalheTermos < ActiveRecord::Migration
  def up
    remove_column :detalhe_termos, :intervalo_almoco
      end

  def down
    add_column :detalhe_termos, :intervalo_almoco, :datetime
  end
end
