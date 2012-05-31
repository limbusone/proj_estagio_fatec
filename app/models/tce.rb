#encoding: utf-8
class Tce < ActiveRecord::Base
  attr_accessible :aluno_id, :convenio_id, :detalhe_termo_id, :rescidido, 
  :validado, :assinado_professor, :detalhe_termo_attributes, :responsavel_nome, :responsavel_cargo 
  belongs_to :detalhe_termo
  belongs_to :convenio
  belongs_to :aluno
  accepts_nested_attributes_for :detalhe_termo
  has_many :tas
  has_many :pedido_alteracaos, :as => :alteravel
  
  validates_presence_of :convenio_id
  validates_presence_of :aluno_id
  
end
