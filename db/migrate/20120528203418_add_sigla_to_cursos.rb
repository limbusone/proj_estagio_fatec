class AddSiglaToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :sigla, :string
  end
end
