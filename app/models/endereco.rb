class Endereco < ActiveRecord::Base
  attr_accessible :bairro, :cep, :cidade, :estado, :logradouro, :numero
end
