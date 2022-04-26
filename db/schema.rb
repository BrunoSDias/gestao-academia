# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_19_013555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "andamento_exercicios", force: :cascade do |t|
    t.bigint "exercicio_treino_cliente_id"
    t.integer "status"
    t.string "mensagem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercicio_treino_cliente_id"], name: "index_andamento_exercicios_on_exercicio_treino_cliente_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.bigint "whatsapp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password"
  end

  create_table "enderecos", force: :cascade do |t|
    t.bigint "cliente_id"
    t.string "rua"
    t.integer "cep"
    t.string "estado"
    t.string "cidade"
    t.string "complemento"
    t.string "numero"
    t.string "bairro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_enderecos_on_cliente_id"
  end

  create_table "exercicio_treino_clientes", force: :cascade do |t|
    t.bigint "treino_cliente_id"
    t.bigint "exercicio_id"
    t.integer "ordem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercicio_id"], name: "index_exercicio_treino_clientes_on_exercicio_id"
    t.index ["treino_cliente_id"], name: "index_exercicio_treino_clientes_on_treino_cliente_id"
  end

  create_table "exercicios", force: :cascade do |t|
    t.bigint "treino_id"
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treino_id"], name: "index_exercicios_on_treino_id"
  end

  create_table "operadors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.boolean "administrador"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagamentos", force: :cascade do |t|
    t.bigint "cliente_id"
    t.datetime "prazo"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pagamentos_on_cliente_id"
  end

  create_table "treinadors", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treino_clientes", force: :cascade do |t|
    t.bigint "cliente_id"
    t.bigint "treino_id"
    t.integer "dia_semana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_treino_clientes_on_cliente_id"
    t.index ["treino_id"], name: "index_treino_clientes_on_treino_id"
  end

  create_table "treino_exercicios", force: :cascade do |t|
    t.bigint "treino_id"
    t.bigint "exercicio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercicio_id"], name: "index_treino_exercicios_on_exercicio_id"
    t.index ["treino_id"], name: "index_treino_exercicios_on_treino_id"
  end

  create_table "treino_treinadors", force: :cascade do |t|
    t.bigint "treinador_id"
    t.bigint "treino_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treinador_id"], name: "index_treino_treinadors_on_treinador_id"
    t.index ["treino_id"], name: "index_treino_treinadors_on_treino_id"
  end

  create_table "treinos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "andamento_exercicios", "exercicio_treino_clientes"
  add_foreign_key "enderecos", "clientes"
  add_foreign_key "exercicio_treino_clientes", "exercicios"
  add_foreign_key "exercicio_treino_clientes", "treino_clientes"
  add_foreign_key "exercicios", "treinos"
  add_foreign_key "pagamentos", "clientes"
  add_foreign_key "treino_clientes", "clientes"
  add_foreign_key "treino_clientes", "treinos"
  add_foreign_key "treino_exercicios", "exercicios"
  add_foreign_key "treino_exercicios", "treinos"
  add_foreign_key "treino_treinadors", "treinadors"
  add_foreign_key "treino_treinadors", "treinos"
end
