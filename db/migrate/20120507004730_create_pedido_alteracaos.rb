class CreatePedidoAlteracaos < ActiveRecord::Migration
  def change
    create_table :pedido_alteracaos do |t|
      t.integer :professor_id
      t.integer :alteravel_id
      t.string :alteravel_type
      t.integer :detalhe_termo_id
      t.text :comentario
      t.boolean :atendido

      t.timestamps
    end
  end
end
