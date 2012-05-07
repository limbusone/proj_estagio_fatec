class CreateHoraDia < ActiveRecord::Migration
  def change
    create_table :hora_dia do |t|
      t.integer :detalhe_termo_id
      t.datetime :inicio
      t.datetime :final

      t.timestamps
    end
  end
end
