class CreateDetalheTermos < ActiveRecord::Migration
  def change
    create_table :detalhe_termos do |t|
      t.integer :endereco_id
      t.integer :seguradora_id
      t.datetime :data_inicio
      t.datetime :data_termino
      t.float :bolsa_auxilio
      t.datetime :data_de_rescisao
      t.integer :carga_horaria_semanal
      t.datetime :intervalo_almoco

      t.timestamps
    end
  end
end
