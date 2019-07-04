require 'test_helper'

class ProbandosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @probando = probandos(:one)
  end

  test "should get index" do
    get probandos_url
    assert_response :success
  end

  test "should get new" do
    get new_probando_url
    assert_response :success
  end

  test "should create probando" do
    assert_difference('Probando.count') do
      post probandos_url, params: { probando: { number: @probando.number, parragraph: @probando.parragraph, post_id: @probando.post_id, user_id: @probando.user_id } }
    end

    assert_redirected_to probando_url(Probando.last)
  end

  test "should show probando" do
    get probando_url(@probando)
    assert_response :success
  end

  test "should get edit" do
    get edit_probando_url(@probando)
    assert_response :success
  end

  test "should update probando" do
    patch probando_url(@probando), params: { probando: { number: @probando.number, parragraph: @probando.parragraph, post_id: @probando.post_id, user_id: @probando.user_id } }
    assert_redirected_to probando_url(@probando)
  end

  test "should destroy probando" do
    assert_difference('Probando.count', -1) do
      delete probando_url(@probando)
    end

    assert_redirected_to probandos_url
  end
end
