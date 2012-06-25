#encoding: utf-8
class HoraDia < ActiveRecord::Base
  attr_accessible :detalhe_termo_id, :dia_semana, :final, :inicio, :tipo
  belongs_to :detalhe_termo
  validate :validar_h
  def validar_h
    a = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"]
    if (tipo && (((diff = (final - inicio) / 3600) > 6) || (diff < 1)))
      errors[:base] << "Na #{a[dia_semana]}: é preciso ser entre 1 a 6 horas diárias" 
    end
  end
end
