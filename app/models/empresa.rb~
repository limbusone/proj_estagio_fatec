#encoding: utf-8
class Empresa < ActiveRecord::Base
  attr_accessible :cnpj, :email, :nome, :telefone, :endereco, :endereco_id 
  has_one :endereco
	validates_presence_of :nome, :message => "é necessário ser preenchido"
	validates_presence_of :cnpj, :message => "é necessário ser preenchido"		
	
	validates 	:nome, :length => { :maximum => 50 }

	validates 	:cnpj, :numericality => { :only_integer => true, :message => 
              "somente caracteres numéricos" }, :length => { :maximum => 14 }, :allow_blank => true

 	validates 	:telefone, :numericality => { :only_integer => true, :message => 
              "Somente caracteres numéricos" }, :length => { :maximum => 14 }, :allow_blank => true

	validates 	:email, :length => { :maximum => 74 }, :allow_blank => true

  validate :validar_cnpj

  def validar_cnpj

  end

end

