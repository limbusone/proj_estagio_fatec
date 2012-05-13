class DetalheTermo < ActiveRecord::Base
  attr_accessible :bolsa_auxilio, :carga_horaria_semanal, :data_de_rescisao, :data_inicio, :data_termino, :endereco_id, :intervalo_almoco, :seguradora_id, :endereco_attributes, :seguradora_attributes
  has_one :tce
  has_one :pedido_alteracao
  has_one :ta
  has_many :lista_atividades
  has_many :atividades, :through => :lista_atividade
  has_many :hora_dias
  belongs_to :endereco
  belongs_to :seguradora
  accepts_nested_attributes_for :endereco
  accepts_nested_attributes_for :seguradora
  #accepts_nested_attributes_for :atividade
end
