class Empresa < ActiveRecord::Base
	attr_accessible :bairro, :cep, :cidade, :cnpj, :email, :estado, :logradouro, :nome, :numero, :telefone
	has_one :convenio
end
