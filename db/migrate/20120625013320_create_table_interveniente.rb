class CreateTableInterveniente < ActiveRecord::Migration
  def change
    create_table "intervenientes" do |t|
      t.string   "nome",        :limit => 50, :null => false
      t.string   "cnpj",        :limit => 14, :null => false
      t.string   "telefone"
      t.string   "email",       :limit => 74
      t.integer  "endereco_id"
      t.timestamps
    end
  end
end
