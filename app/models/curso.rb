class Curso < ActiveRecord::Base
  attr_accessible :nome, :sigla
  has_many :alunos
end
