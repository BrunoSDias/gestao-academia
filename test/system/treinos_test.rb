require "application_system_test_case"

class TreinosTest < ApplicationSystemTestCase
  setup do
    @treino = treinos(:one)
  end

  test "visiting the index" do
    visit treinos_url
    assert_selector "h1", text: "Treinos"
  end

  test "creating a Treino" do
    visit treinos_url
    click_on "New Treino"

    fill_in "Nome", with: @treino.nome
    click_on "Create Treino"

    assert_text "Treino was successfully created"
    click_on "Back"
  end

  test "updating a Treino" do
    visit treinos_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @treino.nome
    click_on "Update Treino"

    assert_text "Treino was successfully updated"
    click_on "Back"
  end

  test "destroying a Treino" do
    visit treinos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Treino was successfully destroyed"
  end
end
