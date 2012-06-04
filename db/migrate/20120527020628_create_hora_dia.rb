class CreateHoraDia < ActiveRecord::Migration
  def up
    create_table :hora_dia do |t|
      t.integer :detalhe_termo_id
      t.integer :dia_semana
      t.datetime :inicio
      t.datetime :final
      t.boolean :tipo
      t.timestamps
    end
  end
  def down
    drop_table :hora_dia
  end
end
