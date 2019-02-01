require 'test_helper'

module Admin
  class GalleryTypesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @gallery_type = admin_gallery_types(:one)
    end

    test "should get index" do
      get gallery_types_url
      assert_response :success
    end

    test "should get new" do
      get new_gallery_type_url
      assert_response :success
    end

    test "should create gallery_type" do
      assert_difference('GalleryType.count') do
        post gallery_types_url, params: { gallery_type: {  } }
      end

      assert_redirected_to gallery_type_url(GalleryType.last)
    end

    test "should show gallery_type" do
      get gallery_type_url(@gallery_type)
      assert_response :success
    end

    test "should get edit" do
      get edit_gallery_type_url(@gallery_type)
      assert_response :success
    end

    test "should update gallery_type" do
      patch gallery_type_url(@gallery_type), params: { gallery_type: {  } }
      assert_redirected_to gallery_type_url(@gallery_type)
    end

    test "should destroy gallery_type" do
      assert_difference('GalleryType.count', -1) do
        delete gallery_type_url(@gallery_type)
      end

      assert_redirected_to gallery_types_url
    end
  end
end
