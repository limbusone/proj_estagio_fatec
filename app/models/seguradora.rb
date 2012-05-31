#encoding: utf-8
class Seguradora < ActiveRecord::Base
  attr_accessible :apolice, :nome
  has_many :detalhe_termos
end
