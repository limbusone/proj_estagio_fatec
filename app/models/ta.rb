#encoding: utf-8
class Ta < ActiveRecord::Base
  attr_accessible :assinado_professor, :detalhe_termo_id, :tce_id, :validado
  belongs_to :detalhe_termo
  belongs_to :tce
  has_many :pedido_alteracaos, :as => :alteravel
end
