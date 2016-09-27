require 'test_helper'

class DiariasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diaria = diarias(:one)
  end

  test "should get index" do
    get diarias_url
    assert_response :success
  end

  test "should get new" do
    get new_diaria_url
    assert_response :success
  end

  test "should create diaria" do
    assert_difference('Diaria.count') do
      post diarias_url, params: { diaria: { favorecido: @diaria.favorecido, orgao: @diaria.orgao, orgao_superior: @diaria.orgao_superior, unidade_gestora: @diaria.unidade_gestora, valor: @diaria.valor } }
    end

    assert_redirected_to diaria_url(Diaria.last)
  end

  test "should show diaria" do
    get diaria_url(@diaria)
    assert_response :success
  end

  test "should get edit" do
    get edit_diaria_url(@diaria)
    assert_response :success
  end

  test "should update diaria" do
    patch diaria_url(@diaria), params: { diaria: { favorecido: @diaria.favorecido, orgao: @diaria.orgao, orgao_superior: @diaria.orgao_superior, unidade_gestora: @diaria.unidade_gestora, valor: @diaria.valor } }
    assert_redirected_to diaria_url(@diaria)
  end

  test "should destroy diaria" do
    assert_difference('Diaria.count', -1) do
      delete diaria_url(@diaria)
    end

    assert_redirected_to diarias_url
  end
end
