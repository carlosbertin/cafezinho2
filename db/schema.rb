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

ActiveRecord::Schema.define(version: 2018_10_09_173509) do

  create_table "arrecadacoes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "mes_ano"
    t.float "valor_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mes_ano"], name: "index_arrecadacoes_on_mes_ano", unique: true
  end

  create_table "arrecadamentos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "valor_pago"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuario_id"
    t.bigint "arrecadacao_id"
    t.index ["arrecadacao_id"], name: "index_arrecadamentos_on_arrecadacao_id"
    t.index ["usuario_id", "arrecadacao_id"], name: "index_arrecadamentos_on_usuario_id_and_arrecadacao_id", unique: true
    t.index ["usuario_id"], name: "index_arrecadamentos_on_usuario_id"
  end

  create_table "compras", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "preco"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "produto_id"
    t.bigint "arrecadacao_id"
    t.datetime "data_compra"
    t.index ["arrecadacao_id"], name: "index_compras_on_arrecadacao_id"
    t.index ["produto_id", "arrecadacao_id"], name: "index_compras_on_produto_id_and_arrecadacao_id", unique: true
    t.index ["produto_id"], name: "index_compras_on_produto_id"
  end

  create_table "produtos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "unidade"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.datetime "data_desativacao"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
