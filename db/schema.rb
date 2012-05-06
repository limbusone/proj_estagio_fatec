# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120506025814) do

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

  create_table "detalhe_termos", :force => true do |t|
    t.integer  "endereco_id"
    t.integer  "seguradora_id"
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.float    "bolsa_auxilio"
    t.datetime "data_de_rescisao"
    t.integer  "carga_horaria_semanal"
    t.datetime "intervalo_almoco"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
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

  create_table "tces", :force => true do |t|
    t.integer  "aluno_id"
    t.integer  "convenio_id"
    t.integer  "detalhe_termo_id"
    t.boolean  "rescidido"
    t.boolean  "validado"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "assinado_professor"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
