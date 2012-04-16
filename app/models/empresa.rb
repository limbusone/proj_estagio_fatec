#encoding: utf-8
class Empresa < ActiveRecord::Base
  attr_accessible :cnpj, :email, :nome, :telefone, :endereco, :endereco_id 
  belongs_to :endereco
	validates_presence_of :nome, :message => "é necessário ser preenchido"
	validates_presence_of :cnpj, :message => "é necessário ser preenchido"		
	
	validates 	:nome, :length => { :maximum => 50 }

	validates 	:cnpj, :numericality => { :only_integer => true, :message => 
              "somente caracteres numéricos" }, :length => { :maximum => 14 }, :allow_blank => true

 	validates 	:telefone, 
#              :numericality => { :only_integer => true, :message => "Somente caracteres numéricos" }, 
              :length => { :maximum => 18 }, :allow_blank => true

	validates 	:email, :length => { :maximum => 74 }, :allow_blank => true, :format => {:with => /\b[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\b/, :message => "formato inválido aaaa@bbbb.ccc"}

  validate :validar_cnpj

  def validar_cnpj
    if (cnpj.length > 0)
      #verificando se digitos são iguais
      z = 1
      primeiro_digito = cnpj[0]
      while cnpj[z] == primeiro_digito
        if (z == 13)
          errors.add(:cnpj, "é inválido : digitos iguais")
          return
        end
        z += 1
      end
      #começando algoritmo de verificação
      a = []
      b = 0
      c = [6,5,4,3,2,9,8,7,6,5,4,3,2]
      for i in 0..11
        a[i] = cnpj[i]
        b += Integer(a[i]) * c[i + 1]
      end
      a[12] = (((x = b % 11) < 2)) ? 0 : 11 - x
      b = 0
      for j in 0..12
        b += Integer(a[j]) * c[j]
      end
      a[13] = (((x = b % 11) < 2)) ? 0 : 11 - x
      if (!(Integer(cnpj[12]) == a[12]) || !(Integer(cnpj[13]) == a[13]))
        errors.add(:cnpj, "é inválido")
      end
    end
  end

end

