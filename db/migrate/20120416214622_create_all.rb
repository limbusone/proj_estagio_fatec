class CreateAll < ActiveRecord::Migration
  def change
    create_table "alunos", :force => true do |t|
      t.integer  "endereco_id"
      t.integer  "curso_id"
      t.string   "nome"
      t.string   "num_matricula"
      t.datetime "created_at",    :null => false
      t.datetime "updated_at",    :null => false
    end

    create_table "convenios", :force => true do |t|
      t.integer  "interveniente_id",                    :null => false
      t.integer  "vigencia"
      t.boolean  "rescidido",        :default => false
      t.datetime "created_at",                          :null => false
      t.datetime "updated_at",                          :null => false
      t.integer  "concedente_id"
    end

    create_table "empresas", :force => true do |t|
      t.string   "nome",        :limit => 50, :null => false
      t.string   "cnpj",        :limit => 14, :null => false
      t.string   "telefone"
      t.string   "email",       :limit => 74
      t.datetime "created_at",                :null => false
      t.datetime "updated_at",                :null => false
      t.integer  "endereco_id"
      t.string   "type"
    end

    create_table "enderecos", :force => true do |t|
      t.string   "cep"
      t.string   "logradouro"
      t.integer  "numero"
      t.string   "bairro"
      t.string   "cidade"
      t.string   "estado"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  
  end

end
