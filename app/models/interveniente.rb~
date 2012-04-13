#encoding: utf-8
class Interveniente < ActiveRecord::Base
	attr_accessible :bairro, :cep, :cidade, :cnpj, :email, :estado, :logradouro, :nome, :numero, :telefone
	validates_presence_of :nome, :message => "é necessário ser preenchido"
	validates_presence_of :cnpj, :message => "é necessário ser preenchido"		
	
	validates :nome, :length => { :maximum => 50 }

	validates :cnpj, :numericality => { :only_integer => true, :message => "somente caracteres numéricos" }, :length => { :maximum => 14 }, :allow_blank => true

	validates :telefone, :numericality => { :only_integer => true, :message => "Somente caracteres numéricos" }, 
			  :length => { :maximum => 14 }, :allow_blank => true

	validates :email, :length => { :maximum => 74 }, :allow_blank => true

	validates :cep, :numericality => { :only_integer => true, :message => "somente caracteres numéricos" }, :length => { :maximum => 8 }, :allow_blank => true

	validates :logradouro, :length => { :maximum => 100 }, :allow_blank => true

	validates :numero, :numericality => { :only_integer => true, :message => "somente caracteres numéricos" }, :allow_blank => true

	validates :bairro, :length => { :maximum => 50 }, :allow_blank => true

	validates :cidade, :length => { :maximum => 50 }, :allow_blank => true

	validates :estado, :length => { :maximum => 2, :minimum => 2 }, :allow_blank => true

	has_many :convenios
end
