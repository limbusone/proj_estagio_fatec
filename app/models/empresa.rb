class Empresa < ActiveRecord::Base
  attr_accessible :cnpj, :email, :nome, :telefone, :endereco, :endereco_id
  has_one :endereco
end

class Contratante < Empresa
  
end

class Intervenientes < Empresa
  
end
