#encoding: utf-8
class HoraDia < ActiveRecord::Base
  attr_accessible :detalhe_termo_id, :dia_semana, :final, :inicio, :tipo
  belongs_to :detalhe_termo
end
