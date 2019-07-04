require "application_system_test_case"

class ProbandosTest < ApplicationSystemTestCase
  setup do
    @probando = probandos(:one)
  end

  test "visiting the index" do
    visit probandos_url
    assert_selector "h1", text: "Probandos"
  end

  test "creating a Probando" do
    visit probandos_url
    click_on "New Probando"

    fill_in "Number", with: @probando.number
    fill_in "Parragraph", with: @probando.parragraph
    fill_in "Post", with: @probando.post_id
    fill_in "User", with: @probando.user_id
    click_on "Create Probando"

    assert_text "Probando was successfully created"
    click_on "Back"
  end

  test "updating a Probando" do
    visit probandos_url
    click_on "Edit", match: :first

    fill_in "Number", with: @probando.number
    fill_in "Parragraph", with: @probando.parragraph
    fill_in "Post", with: @probando.post_id
    fill_in "User", with: @probando.user_id
    click_on "Update Probando"

    assert_text "Probando was successfully updated"
    click_on "Back"
  end

  test "destroying a Probando" do
    visit probandos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Probando was successfully destroyed"
  end
end
