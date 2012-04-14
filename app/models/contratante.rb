class Contratante < Empresa
  attr_accessible :convenio, :convenio_id
  has_one :convenio  
end
