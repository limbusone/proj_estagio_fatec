class ListaAtividade < ActiveRecord::Base
  attr_accessible :atividade_id, :detalhe_termo_id
  belongs_to :atividade
  belongs_to :detalhe_termo
end
