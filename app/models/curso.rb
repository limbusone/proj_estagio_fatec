#encoding: utf-8
class Curso < ActiveRecord::Base
  attr_accessible :nome, :sigla
  has_many :alunos
end