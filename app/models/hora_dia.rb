class HoraDia < ActiveRecord::Base
  attr_accessible :detalhe_termo_id, :dia_semana, :final, :inicio
  belongs_to :detalhe_termo
end
