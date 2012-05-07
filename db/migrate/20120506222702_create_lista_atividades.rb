class CreateListaAtividades < ActiveRecord::Migration
  def change
    create_table :lista_atividades do |t|
      t.integer :detalhe_termo_id
      t.integer :atividade_id

      t.timestamps
    end
  end
end
