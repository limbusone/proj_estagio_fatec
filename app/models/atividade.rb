class Atividade < ActiveRecord::Base
  attr_accessible :descricao, :nome
  has_many :lista_atividades
  has_many :detalhe_termos, :through => :lista_atividade
end
