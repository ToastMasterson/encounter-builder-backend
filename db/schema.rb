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

ActiveRecord::Schema.define(version: 2019_09_11_180312) do

  create_table "encounters", force: :cascade do |t|
    t.string "title"
    t.integer "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_encounters_on_master_id"
  end

  create_table "masters", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monster_encounters", force: :cascade do |t|
    t.integer "monster_id"
    t.integer "encounter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encounter_id"], name: "index_monster_encounters_on_encounter_id"
    t.index ["monster_id"], name: "index_monster_encounters_on_monster_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.integer "index"
    t.string "name"
    t.string "size"
    t.string "style"
    t.string "subtype"
    t.string "alignment"
    t.integer "armor_class"
    t.integer "hit_points"
    t.string "hit_dice"
    t.string "speed"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "constitution_save"
    t.integer "intelligence_save"
    t.integer "wisdom_save"
    t.integer "history"
    t.integer "perception"
    t.string "damage_vulnerabilities"
    t.string "damage_resistances"
    t.string "damage_immunities"
    t.string "condition_immunities"
    t.string "senses"
    t.string "languages"
    t.float "challenge_rating"
    t.string "special_abilities"
    t.string "actions"
    t.string "legendary_actions"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
