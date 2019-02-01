require "application_system_test_case"

module Admin
  class GalleryTypesTest < ApplicationSystemTestCase
    setup do
      @gallery_type = admin_gallery_types(:one)
    end

    test "visiting the index" do
      visit gallery_types_url
      assert_selector "h1", text: "Gallery Types"
    end

    test "creating a Gallery type" do
      visit gallery_types_url
      click_on "New Gallery Type"

      click_on "Create Gallery type"

      assert_text "Gallery type was successfully created"
      click_on "Back"
    end

    test "updating a Gallery type" do
      visit gallery_types_url
      click_on "Edit", match: :first

      click_on "Update Gallery type"

      assert_text "Gallery type was successfully updated"
      click_on "Back"
    end

    test "destroying a Gallery type" do
      visit gallery_types_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Gallery type was successfully destroyed"
    end
  end
end
