#encoding: utf-8
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

  test "Empresa without name is not valid" do
    @empresa.nome = nil
    assert !@empresa.valid?
  end

  test "Empresa without cnpj is not valid" do
    @empresa.cnpj = nil
    assert !@empresa.valid?
  end

  test "Empresa's name must have 50 characters max" do
    @empresa.nome = "a" * 51
    assert !@empresa.valid?
  end

  test "Empresa's cnpj must be number" do
    @empresa.cnpj = "a"
    assert !@empresa.valid?, "somente caracteres numéricos"
  end

  test "Empresa's cnpj must have 14 characters max" do
    @empresa.cnpj = "1231231141414"
    assert @empresa.valid?, "blabla"
  end
end
