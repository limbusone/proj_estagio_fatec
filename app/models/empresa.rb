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

end

class Contratante < Empresa
  attr_accessible :convenio, :convenio_id
  has_one :convenio  
end

class Intervenientes < Empresa
  attr_accessible :convenios
  has_many :convenios
end
