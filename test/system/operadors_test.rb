require "application_system_test_case"

class OperadorsTest < ApplicationSystemTestCase
  setup do
    @operador = operadors(:one)
  end

  test "visiting the index" do
    visit operadors_url
    assert_selector "h1", text: "Operadors"
  end

  test "creating a Operador" do
    visit operadors_url
    click_on "New Operador"

    check "Administrador" if @operador.administrador
    fill_in "Email", with: @operador.email
    fill_in "Nome", with: @operador.nome
    fill_in "Password", with: @operador.password
    fill_in "Password digest", with: @operador.password_digest
    click_on "Create Operador"

    assert_text "Operador was successfully created"
    click_on "Back"
  end

  test "updating a Operador" do
    visit operadors_url
    click_on "Edit", match: :first

    check "Administrador" if @operador.administrador
    fill_in "Email", with: @operador.email
    fill_in "Nome", with: @operador.nome
    fill_in "Password", with: @operador.password
    fill_in "Password digest", with: @operador.password_digest
    click_on "Update Operador"

    assert_text "Operador was successfully updated"
    click_on "Back"
  end

  test "destroying a Operador" do
    visit operadors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Operador was successfully destroyed"
  end
end
