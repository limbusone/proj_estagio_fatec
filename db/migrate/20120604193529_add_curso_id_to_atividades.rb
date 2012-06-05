class AddCursoIdToAtividades < ActiveRecord::Migration
  def change
    add_column :atividades, :curso_id, :integer
  end
end
