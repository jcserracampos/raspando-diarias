require 'test_helper'

class DiariaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diarium = diaria(:one)
  end

  test "should get index" do
    get diaria_index_url
    assert_response :success
  end

  test "should get new" do
    get new_diarium_url
    assert_response :success
  end

  test "should create diarium" do
    assert_difference('Diaria.count') do
      post diaria_index_url, params: { diarium: { favorecido: @diarium.favorecido, orgao: @diarium.orgao, orgao_superior: @diarium.orgao_superior, unidade_gestora: @diarium.unidade_gestora, valor: @diarium.valor } }
    end

    assert_redirected_to diarium_url(Diaria.last)
  end

  test "should show diarium" do
    get diarium_url(@diarium)
    assert_response :success
  end

  test "should get edit" do
    get edit_diarium_url(@diarium)
    assert_response :success
  end

  test "should update diarium" do
    patch diarium_url(@diarium), params: { diarium: { favorecido: @diarium.favorecido, orgao: @diarium.orgao, orgao_superior: @diarium.orgao_superior, unidade_gestora: @diarium.unidade_gestora, valor: @diarium.valor } }
    assert_redirected_to diarium_url(@diarium)
  end

  test "should destroy diarium" do
    assert_difference('Diaria.count', -1) do
      delete diarium_url(@diarium)
    end

    assert_redirected_to diaria_index_url
  end
end
