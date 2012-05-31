class AddResponsavelCargoToTces < ActiveRecord::Migration
  def change
    add_column :tces, :responsavel_cargo, :string
  end
end
