class Atividade < ActiveRecord::Base
  attr_accessible :curso_id, :descricao, :nome
  has_many :detalhe_termos, :through => :lista_atividade
  belongs_to :curso
end
