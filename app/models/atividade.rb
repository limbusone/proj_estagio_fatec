#encoding: utf-8
class Atividade < ActiveRecord::Base
  attr_accessible :curso_id, :descricao, :nome
  validates_presence_of :nome, :message => "é necessário ser preenchido"
  has_many :detalhe_termos, :through => :lista_atividade
  belongs_to :curso
end
