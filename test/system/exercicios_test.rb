require "application_system_test_case"

class ExerciciosTest < ApplicationSystemTestCase
  setup do
    @exercicio = exercicios(:one)
  end

  test "visiting the index" do
    visit exercicios_url
    assert_selector "h1", text: "Exercicios"
  end

  test "creating a Exercicio" do
    visit exercicios_url
    click_on "New Exercicio"

    fill_in "Descricao", with: @exercicio.descricao
    fill_in "Nome", with: @exercicio.nome
    fill_in "Treino", with: @exercicio.treino_id
    click_on "Create Exercicio"

    assert_text "Exercicio was successfully created"
    click_on "Back"
  end

  test "updating a Exercicio" do
    visit exercicios_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @exercicio.descricao
    fill_in "Nome", with: @exercicio.nome
    fill_in "Treino", with: @exercicio.treino_id
    click_on "Update Exercicio"

    assert_text "Exercicio was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercicio" do
    visit exercicios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercicio was successfully destroyed"
  end
end
