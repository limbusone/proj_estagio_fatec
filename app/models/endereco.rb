#encoding: utf-8
class Endereco < ActiveRecord::Base
  attr_accessible :bairro, :cep, :cidade, :estado, :logradouro, :numero

	validates 	:cep, :numericality => { :only_integer => true, :message => "somente caracteres 				      numéricos" }, :length => { :maximum => 8 }, :allow_blank => true

	validates 	:logradouro, :length => { :maximum => 100 }, :allow_blank => true

	validates 	:numero, :numericality => { :only_integer => true, :message => "somente caracteres 					      numéricos" }, :allow_blank => true

	validates 	:estado, :length => { :maximum => 2, :minimum => 2 }, :allow_blank => true
  has_many :alunos
  
end
