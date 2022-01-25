require "application_system_test_case"

class TreinadorsTest < ApplicationSystemTestCase
  setup do
    @treinador = treinadors(:one)
  end

  test "visiting the index" do
    visit treinadors_url
    assert_selector "h1", text: "Treinadors"
  end

  test "creating a Treinador" do
    visit treinadors_url
    click_on "New Treinador"

    fill_in "Email", with: @treinador.email
    fill_in "Nome", with: @treinador.nome
    fill_in "Password", with: @treinador.password
    fill_in "Password digest", with: @treinador.password_digest
    click_on "Create Treinador"

    assert_text "Treinador was successfully created"
    click_on "Back"
  end

  test "updating a Treinador" do
    visit treinadors_url
    click_on "Edit", match: :first

    fill_in "Email", with: @treinador.email
    fill_in "Nome", with: @treinador.nome
    fill_in "Password", with: @treinador.password
    fill_in "Password digest", with: @treinador.password_digest
    click_on "Update Treinador"

    assert_text "Treinador was successfully updated"
    click_on "Back"
  end

  test "destroying a Treinador" do
    visit treinadors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Treinador was successfully destroyed"
  end
end
