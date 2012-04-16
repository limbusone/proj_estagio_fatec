require 'test_helper'

class EmpresaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
    @empresa = Empresa.new(:nome => "blabla", :cnpj => "22952653000103")
  end

  test "Empresa is valid" do
    assert @empresa.save! 
  end

  test "Empresa without name is invalid" do
    @empresa.nome = nil
    assert !@empresa.valid?
  end
end
