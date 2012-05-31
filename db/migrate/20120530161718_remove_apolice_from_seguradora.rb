class RemoveApoliceFromSeguradora < ActiveRecord::Migration
  def up
    remove_column :seguradoras, :apolice
      end

  def down
    add_column :seguradoras, :apolice, :int
  end
end
