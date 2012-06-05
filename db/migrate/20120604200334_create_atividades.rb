class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.integer :curso_id
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
