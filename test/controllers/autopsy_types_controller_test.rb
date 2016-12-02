require 'test_helper'

class AutopsyTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autopsy_type = autopsy_types(:one)
  end

  test "should get index" do
    get autopsy_types_url
    assert_response :success
  end

  test "should get new" do
    get new_autopsy_type_url
    assert_response :success
  end

  test "should create autopsy_type" do
    assert_difference('AutopsyType.count') do
      post autopsy_types_url, params: { autopsy_type: { law: @autopsy_type.law, name: @autopsy_type.name } }
    end

    assert_redirected_to autopsy_type_url(AutopsyType.last)
  end

  test "should show autopsy_type" do
    get autopsy_type_url(@autopsy_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_autopsy_type_url(@autopsy_type)
    assert_response :success
  end

  test "should update autopsy_type" do
    patch autopsy_type_url(@autopsy_type), params: { autopsy_type: { law: @autopsy_type.law, name: @autopsy_type.name } }
    assert_redirected_to autopsy_type_url(@autopsy_type)
  end

  test "should destroy autopsy_type" do
    assert_difference('AutopsyType.count', -1) do
      delete autopsy_type_url(@autopsy_type)
    end

    assert_redirected_to autopsy_types_url
  end
end
