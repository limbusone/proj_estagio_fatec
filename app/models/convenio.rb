#encoding: utf-8
class Convenio < ActiveRecord::Base
  attr_accessible :concedente_id, :interveniente_id, :rescidido, :vigencia

	validates_presence_of :concedente_id, :message => "é necessário ser preenchido"

	validates_presence_of :interveniente_id, :message => "é necessário ser preenchido"

  validates   :vigencia, :numericality => { :only_integer => true, :message => 
                "somente caracteres numéricos" }, :allow_blank => true
  
  belongs_to :interveniente
	belongs_to :concedente
end
