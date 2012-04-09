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

ActiveRecord::Schema.define(:version => 20120409021504) do

  create_table "convenios", :force => true do |t|
    t.integer  "empresa_id",                          :null => false
    t.integer  "interveniente_id",                    :null => false
    t.integer  "vigencia"
    t.boolean  "rescidido",        :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "convenios", ["empresa_id"], :name => "fk_convenios_empresas"
  add_index "convenios", ["interveniente_id"], :name => "fk_convenios_intervenientes"

  create_table "empresas", :force => true do |t|
    t.string   "nome",       :limit => 50,  :null => false
    t.string   "cnpj",       :limit => 14,  :null => false
    t.string   "telefone",   :limit => 14
    t.string   "email",      :limit => 74
    t.string   "cep",        :limit => 8
    t.string   "logradouro", :limit => 100
    t.integer  "numero"
    t.string   "bairro",     :limit => 50
    t.string   "cidade",     :limit => 50
    t.string   "estado",     :limit => 2
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "intervenientes", :force => true do |t|
    t.string   "nome",       :limit => 50,  :null => false
    t.string   "cnpj",       :limit => 14,  :null => false
    t.string   "telefone",   :limit => 14
    t.string   "email",      :limit => 74
    t.string   "cep",        :limit => 8
    t.string   "logradouro", :limit => 100
    t.integer  "numero"
    t.string   "bairro",     :limit => 50
    t.string   "cidade",     :limit => 50
    t.string   "estado",     :limit => 2
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
