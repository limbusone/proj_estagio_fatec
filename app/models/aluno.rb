#encoding: utf-8
class Aluno < ActiveRecord::Base
  attr_accessible :curso_id, :endereco_id, :nome, :num_matricula
  validates_presence_of :nome, :message => "é necessário ser preenchido"
  belongs_to :endereco
end
