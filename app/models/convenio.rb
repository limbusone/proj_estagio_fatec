class Convenio < ActiveRecord::Base
	attr_accessible :empresa_id, :interveniente_id, :rescidido, :vigencia
	belongs_to :interveniente
	belongs_to :empresa
end
