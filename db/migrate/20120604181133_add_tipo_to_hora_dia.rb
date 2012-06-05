class AddTipoToHoraDia < ActiveRecord::Migration
  def change
    add_column :hora_dia, :tipo, :boolean
  end
end
