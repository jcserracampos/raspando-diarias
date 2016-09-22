require 'test_helper'

class DiariaPessoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diaria_pessoa = diaria_pessoas(:one)
  end

  test "should get index" do
    get diaria_pessoas_url
    assert_response :success
  end

  test "should get new" do
    get new_diaria_pessoa_url
    assert_response :success
  end

  test "should create diaria_pessoa" do
    assert_difference('DiariaPessoa.count') do
      post diaria_pessoas_url, params: { diaria_pessoa: { favorecido: @diaria_pessoa.favorecido, orgao: @diaria_pessoa.orgao, orgao_superior: @diaria_pessoa.orgao_superior, unidade_gestora: @diaria_pessoa.unidade_gestora, valor: @diaria_pessoa.valor } }
    end

    assert_redirected_to diaria_pessoa_url(DiariaPessoa.last)
  end

  test "should show diaria_pessoa" do
    get diaria_pessoa_url(@diaria_pessoa)
    assert_response :success
  end

  test "should get edit" do
    get edit_diaria_pessoa_url(@diaria_pessoa)
    assert_response :success
  end

  test "should update diaria_pessoa" do
    patch diaria_pessoa_url(@diaria_pessoa), params: { diaria_pessoa: { favorecido: @diaria_pessoa.favorecido, orgao: @diaria_pessoa.orgao, orgao_superior: @diaria_pessoa.orgao_superior, unidade_gestora: @diaria_pessoa.unidade_gestora, valor: @diaria_pessoa.valor } }
    assert_redirected_to diaria_pessoa_url(@diaria_pessoa)
  end

  test "should destroy diaria_pessoa" do
    assert_difference('DiariaPessoa.count', -1) do
      delete diaria_pessoa_url(@diaria_pessoa)
    end

    assert_redirected_to diaria_pessoas_url
  end
end
