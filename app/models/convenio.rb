class Convenio < ActiveRecord::Base
  attr_accessible :empresa_id, :interveniente_id, :rescidido, :vigencia
end
