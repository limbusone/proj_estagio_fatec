class Empresa < ActiveRecord::Base
  attr_accessible :bairro, :cep, :cidade, :email, :estado, :lougradouro, :nome, :numero, :telefone
end
