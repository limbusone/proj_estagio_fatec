#encoding: utf-8
class Concedente < Empresa
#  attr_accessible :convenio, :convenio_id
  has_many :convenios
end
