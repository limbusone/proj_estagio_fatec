class CreateTces < ActiveRecord::Migration
  def change
    create_table :tces do |t|
      t.integer :aluno_id
      t.integer :convenio_id
      t.integer :detalhe_termo_id
      t.boolean :rescidido
      t.boolean :validado
      t.timestamps
    end
  end
end
