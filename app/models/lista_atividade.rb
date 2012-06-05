#encoding: utf-8
class ListaAtividade < ActiveRecord::Base
  attr_accessible :atividade_id, :detalhe_termo_id, :atividade_attributes
  belongs_to :atividade
  belongs_to :detalhe_termo
  accepts_nested_attributes_for :atividade
end
