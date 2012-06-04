#encoding: utf-8
class Aluno < ActiveRecord::Base
  attr_accessible :curso_id, :endereco_id, :nome, :num_matricula, :endereco_attributes
  validates_presence_of :nome, :message => "é necessário ser preenchido"
  validates :num_matricula, :numericality => { :only_integer => true, :message => "somente caracteres numéricos" },
  :allow_blank => true
  validates_presence_of :num_matricula, :message => "é necessário ser preenchido"  
  validates_uniqueness_of :num_matricula, :message => "deve ser único"
  belongs_to :endereco
  belongs_to :curso
  accepts_nested_attributes_for :endereco
  
  def nome_upcase
    nome.upcase
  end
end
