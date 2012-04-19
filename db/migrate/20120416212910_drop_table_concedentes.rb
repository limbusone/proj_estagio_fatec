class DropTableConcedentes < ActiveRecord::Migration
  def up
    drop_table :concedentes
  end

  def down
    create_table :concedentes do |s|
      
    end
  end
end
