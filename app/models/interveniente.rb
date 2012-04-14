class Interveniente < Empresa
  attr_accessible :convenios
  has_many :convenios
end
