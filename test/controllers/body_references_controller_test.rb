require 'test_helper'

class BodyReferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @body_reference = body_references(:one)
  end

  test "should get index" do
    get body_references_url
    assert_response :success
  end

  test "should get new" do
    get new_body_reference_url
    assert_response :success
  end

  test "should create body_reference" do
    assert_difference('BodyReference.count') do
      post body_references_url, params: { body_reference: { name: @body_reference.name } }
    end

    assert_redirected_to body_reference_url(BodyReference.last)
  end

  test "should show body_reference" do
    get body_reference_url(@body_reference)
    assert_response :success
  end

  test "should get edit" do
    get edit_body_reference_url(@body_reference)
    assert_response :success
  end

  test "should update body_reference" do
    patch body_reference_url(@body_reference), params: { body_reference: { name: @body_reference.name } }
    assert_redirected_to body_reference_url(@body_reference)
  end

  test "should destroy body_reference" do
    assert_difference('BodyReference.count', -1) do
      delete body_reference_url(@body_reference)
    end

    assert_redirected_to body_references_url
  end
end
