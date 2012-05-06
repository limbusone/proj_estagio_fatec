class CreateTa < ActiveRecord::Migration
  def change
    create_table :ta do |t|
      t.integer :tce_id
      t.integer :detalhe_termo_id
      t.boolean :validado
      t.boolean :assinado_professor

      t.timestamps
    end
  end
end
