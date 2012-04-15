class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.integer :endereco_id
      t.integer :curso_id
      t.string :nome
      t.string :num_matricula

      t.timestamps
    end
  end
end
