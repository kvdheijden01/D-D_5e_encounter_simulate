# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_28_143041) do

  create_table "attackplayers", force: :cascade do |t|
    t.string "name"
    t.string "ability_mod"
    t.float "dmg"
    t.integer "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "ability_modifier_dmg"
    t.index ["player_id"], name: "index_attackplayers_on_player_id"
  end

  create_table "attacks", force: :cascade do |t|
    t.string "name"
    t.string "ability_mod"
    t.float "dmg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "creaturetype_id"
    t.boolean "ability_modifier_dmg"
    t.index ["creaturetype_id"], name: "index_attacks_on_creaturetype_id"
  end

  create_table "creatures", force: :cascade do |t|
    t.integer "enemy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "creaturetype_id", null: false
    t.index ["creaturetype_id"], name: "index_creatures_on_creaturetype_id"
    t.index ["enemy_id"], name: "index_creatures_on_enemy_id"
  end

  create_table "creaturetypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "HP"
    t.integer "AC"
    t.integer "proficiency"
    t.integer "STR"
    t.integer "DEX"
    t.integer "CON"
    t.integer "INT"
    t.integer "WIS"
    t.integer "CHA"
  end

  create_table "encounters", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enemies", force: :cascade do |t|
    t.float "HPpool"
    t.float "DmgPerRound"
    t.integer "encounter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encounter_id"], name: "index_enemies_on_encounter_id"
  end

  create_table "parties", force: :cascade do |t|
    t.float "HPpool"
    t.float "DmgPerRound"
    t.integer "encounter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["encounter_id"], name: "index_parties_on_encounter_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "HP"
    t.integer "AC"
    t.integer "proficiency"
    t.integer "STR"
    t.integer "DEX"
    t.integer "CON"
    t.integer "INT"
    t.integer "WIS"
    t.integer "CHA"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "party_id"
    t.index ["party_id"], name: "index_players_on_party_id"
  end

  add_foreign_key "attackplayers", "players"
  add_foreign_key "attacks", "creaturetypes"
  add_foreign_key "creatures", "creaturetypes"
  add_foreign_key "creatures", "enemies"
  add_foreign_key "enemies", "encounters"
  add_foreign_key "parties", "encounters"
  add_foreign_key "players", "parties"
end
