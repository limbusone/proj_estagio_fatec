class AddComentarioToDetalheTermos < ActiveRecord::Migration
  def change
    add_column :detalhe_termos, :comentario, :text
  end
end
