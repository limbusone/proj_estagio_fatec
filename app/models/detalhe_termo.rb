#encoding: utf-8
class DetalheTermo < ActiveRecord::Base
  attr_accessible :bolsa_auxilio, :carga_horaria_semanal, :data_de_rescisao, :data_inicio, :data_termino, :endereco_id, 
  :intervalo_almoco, :seguradora_id, :endereco_attributes, :seguradora_attributes, :comentario, :apolice
  has_one :tce
  has_one :pedido_alteracao
  has_one :ta
  has_many :lista_atividades
  has_many :atividades, :through => :lista_atividade
  has_many :hora_dias, :dependent => :destroy
  belongs_to :endereco, :dependent => :destroy
  belongs_to :seguradora
  accepts_nested_attributes_for :endereco
  accepts_nested_attributes_for :seguradora
  #accepts_nested_attributes_for :atividade
  validates :bolsa_auxilio, 
  :numericality => { :message => "somente caracteres numéricos" }, 
  :allow_blank => true
  validates :carga_horaria_semanal, :allow_blank => true,
  :numericality => { :only_integer => true, :message => "somente caracteres numéricos" } 
  validates :carga_horaria_semanal, :allow_blank => true,  
  :numericality => { :less_than_or_equal_to => 30, :message => "deve ser menor que 30" }
  validates :carga_horaria_semanal, :allow_blank => true,
  :numericality => { :greater_than => 0, :message => "deve ser maior que 0" }
  validates :apolice, :numericality => { :only_integer => true, :message => "somente caracteres numéricos"},
  :allow_blank => true
end
