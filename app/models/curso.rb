#encoding: utf-8
class Curso < ActiveRecord::Base
  attr_accessible :nome, :sigla
  has_many :alunos
  validates_presence_of :nome, :message => "é necessário ser preenchido"
  validates_presence_of :sigla, :message => "é necessário ser preenchido"
end
