require "application_system_test_case"

class TreinoClientesTest < ApplicationSystemTestCase
  setup do
    @treino_cliente = treino_clientes(:one)
  end

  test "visiting the index" do
    visit treino_clientes_url
    assert_selector "h1", text: "Treino Clientes"
  end

  test "creating a Treino cliente" do
    visit treino_clientes_url
    click_on "New Treino Cliente"

    fill_in "Cliente", with: @treino_cliente.cliente_id
    fill_in "Dia semana", with: @treino_cliente.dia_semana
    fill_in "Treino", with: @treino_cliente.treino_id
    click_on "Create Treino cliente"

    assert_text "Treino cliente was successfully created"
    click_on "Back"
  end

  test "updating a Treino cliente" do
    visit treino_clientes_url
    click_on "Edit", match: :first

    fill_in "Cliente", with: @treino_cliente.cliente_id
    fill_in "Dia semana", with: @treino_cliente.dia_semana
    fill_in "Treino", with: @treino_cliente.treino_id
    click_on "Update Treino cliente"

    assert_text "Treino cliente was successfully updated"
    click_on "Back"
  end

  test "destroying a Treino cliente" do
    visit treino_clientes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Treino cliente was successfully destroyed"
  end
end
