require "application_system_test_case"

class CollectivesTest < ApplicationSystemTestCase
  setup do
    @collective = collectives(:one)
  end

  test "visiting the index" do
    visit collectives_url
    assert_selector "h1", text: "Collectives"
  end

  test "should create collective" do
    visit collectives_url
    click_on "New collective"

    click_on "Create Collective"

    assert_text "Collective was successfully created"
    click_on "Back"
  end

  test "should update Collective" do
    visit collective_url(@collective)
    click_on "Edit this collective", match: :first

    click_on "Update Collective"

    assert_text "Collective was successfully updated"
    click_on "Back"
  end

  test "should destroy Collective" do
    visit collective_url(@collective)
    click_on "Destroy this collective", match: :first

    assert_text "Collective was successfully destroyed"
  end
end
