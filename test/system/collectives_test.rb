require "application_system_test_case"

class CollectivesTest < ApplicationSystemTestCase
  setup do
    @collective = collectives(:lewagang)
  end

  test "visiting the index" do
    visit collectives_url
    assert_selector "h1", text: "Coletivos"
  end

  test "should not be able to create a collective without a name" do
    login_as users(:meleu)

    visit new_collective_path

    click_on "Create Collective"

    assert_text "Name can't be blank"
  end

  test "let a signed in user create a collective" do
    login_as users(:meleu)

    visit new_collective_path

    fill_in "collective_name", with: "Dopez"
    fill_in "collective_description", with: "This is a dope Collective"
    select 'RJ', from: 'collective_state'

    click_on "Create Collective"

    assert_text "Collective was successfully created"
  end

  test "should update a Collective" do
    login_as users(:meleu)

    visit collective_url(@collective)
    click_on "Editar coletivo", match: :first

    fill_in "collective_name", with: "Dopez[Edited]"
    fill_in "collective_description", with: "This is a dope [edited] Collective"

    click_on "Update Collective"

    assert_text "Collective was successfully updated"
  end

  test "should not be able to view the edit page of another person's Collective" do
    login_as users(:meleu)

    visit edit_collective_url(collectives(:another_collective))

    assert_text "You are not authorized to perform this action."
  end

  test "should destroy Collective" do
    login_as users(:meleu)

    visit edit_collective_url(@collective)

    accept_alert do
      click_on "Destroy this collective", match: :first
    end

    assert_text "Collective was successfully destroyed"
  end
end
