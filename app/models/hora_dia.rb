class HoraDia < ActiveRecord::Base
  attr_accessible :detalhe_termo_id, :final, :inicio
  belongs_to :detalhe_termo
end
