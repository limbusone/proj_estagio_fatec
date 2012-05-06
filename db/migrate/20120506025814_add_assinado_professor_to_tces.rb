class AddAssinadoProfessorToTces < ActiveRecord::Migration
  def change
    add_column :tces, :assinado_professor, :boolean
  end
end
