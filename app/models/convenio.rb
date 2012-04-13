#encoding: utf-8
class Convenio < ActiveRecord::Base
	attr_accessible :empresa_id, :interveniente_id, :rescidido, :vigencia
	validates_presence_of :empresa_id, :message => "é necessário ser preenchido"
	validates_presence_of :interveniente_id, :message => "é necessário ser preenchido"
	belongs_to :interveniente
	belongs_to :empresa


end
