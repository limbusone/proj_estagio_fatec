class Concedente < Empresa
#  attr_accessible :convenio, :convenio_id
  has_one :convenio
end
