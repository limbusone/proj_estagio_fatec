#encoding: utf-8
class PedidoAlteracao < ActiveRecord::Base
  attr_accessible :alteravel_id, :alteravel_type, :atendido, :comentario, :detalhe_termo_id, :professor_id
  belongs_to :alteravel, :polymorphic => true
end
