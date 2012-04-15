class CreateConcedentes < ActiveRecord::Migration
  def change
    create_table :concedentes do |t|

      t.timestamps
    end
  end
end
