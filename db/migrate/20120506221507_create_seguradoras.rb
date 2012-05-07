class CreateSeguradoras < ActiveRecord::Migration
  def change
    create_table :seguradoras do |t|
      t.string :nome
      t.integer :apolice

      t.timestamps
    end
  end
end
