class Tce < ActiveRecord::Base
  attr_accessible :aluno_id, :convenio_id, :detalhe_termo_id, :rescidido, :validado
  belongs_to :detalhe_termo
  belongs_to :convenio
  belongs_to :aluno
  has_many :tas
  has_many :pedido_alteracaos, :as => :alteravel
end
