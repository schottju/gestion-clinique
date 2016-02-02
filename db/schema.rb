# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161126003333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "house_number"
    t.string   "flat_number"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "zip_code"
    t.integer  "user_id"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "animals", force: :cascade do |t|
    t.string   "id_number"
    t.string   "name"
    t.date     "birth_date"
    t.integer  "amount"
    t.float    "weight"
    t.integer  "gender"
    t.float    "age"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "proprio_id"
    t.integer  "species_id"
    t.integer  "statut",      default: 0
  end

  add_index "animals", ["proprio_id"], name: "index_animals_on_proprio_id", using: :btree
  add_index "animals", ["species_id"], name: "index_animals_on_species_id", using: :btree

  create_table "animals_hospits", id: false, force: :cascade do |t|
    t.integer "hospit_id", null: false
    t.integer "animal_id", null: false
  end

  add_index "animals_hospits", ["animal_id"], name: "index_animals_hospits_on_animal_id", using: :btree
  add_index "animals_hospits", ["hospit_id"], name: "index_animals_hospits_on_hospit_id", using: :btree

  create_table "animals_medical_records", id: false, force: :cascade do |t|
    t.integer "medical_record_id", null: false
    t.integer "animal_id",         null: false
  end

  add_index "animals_medical_records", ["animal_id"], name: "index_animals_medical_records_on_animal_id", using: :btree
  add_index "animals_medical_records", ["medical_record_id"], name: "index_animals_medical_records_on_medical_record_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "num"
    t.text     "comment"
    t.integer  "veterinarian_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "comments", ["veterinarian_id"], name: "index_comments_on_veterinarian_id", using: :btree

  create_table "comments_medical_records", id: false, force: :cascade do |t|
    t.integer "medical_record_id", null: false
    t.integer "comment_id",        null: false
  end

  add_index "comments_medical_records", ["comment_id"], name: "index_comments_medical_records_on_comment_id", using: :btree
  add_index "comments_medical_records", ["medical_record_id"], name: "index_comments_medical_records_on_medical_record_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string "chose"
    t.string "info"
  end

  create_table "contacts_proprios", id: false, force: :cascade do |t|
    t.integer "proprio_id", null: false
    t.integer "contact_id", null: false
  end

  add_index "contacts_proprios", ["contact_id"], name: "index_contacts_proprios_on_contact_id", using: :btree
  add_index "contacts_proprios", ["proprio_id"], name: "index_contacts_proprios_on_proprio_id", using: :btree

  create_table "diseases", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  create_table "diseases_hospits", id: false, force: :cascade do |t|
    t.integer "disease_id", null: false
    t.integer "hospit_id",  null: false
  end

  add_index "diseases_hospits", ["disease_id"], name: "index_diseases_hospits_on_disease_id", using: :btree
  add_index "diseases_hospits", ["hospit_id"], name: "index_diseases_hospits_on_hospit_id", using: :btree

  create_table "diseases_medical_records", id: false, force: :cascade do |t|
    t.integer "disease_id",        null: false
    t.integer "medical_record_id", null: false
  end

  add_index "diseases_medical_records", ["disease_id"], name: "index_diseases_medical_records_on_disease_id", using: :btree
  add_index "diseases_medical_records", ["medical_record_id"], name: "index_diseases_medical_records_on_medical_record_id", using: :btree

  create_table "hospitactes", force: :cascade do |t|
    t.text     "comment"
    t.text     "soin"
    t.integer  "veterinarian_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "hospitactes", ["veterinarian_id"], name: "index_hospitactes_on_veterinarian_id", using: :btree

  create_table "hospitactes_hospits", id: false, force: :cascade do |t|
    t.integer "hospit_id",     null: false
    t.integer "hospitacte_id", null: false
  end

  add_index "hospitactes_hospits", ["hospit_id"], name: "index_hospitactes_hospits_on_hospit_id", using: :btree
  add_index "hospitactes_hospits", ["hospitacte_id"], name: "index_hospitactes_hospits_on_hospitacte_id", using: :btree

  create_table "hospits", force: :cascade do |t|
    t.text     "anamnesis"
    t.text     "description"
    t.text     "comment"
    t.string   "poids"
    t.integer  "proprio_id"
    t.integer  "veterinarian_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "disease_id"
  end

  add_index "hospits", ["disease_id"], name: "index_hospits_on_disease_id", using: :btree
  add_index "hospits", ["proprio_id"], name: "index_hospits_on_proprio_id", using: :btree
  add_index "hospits", ["veterinarian_id"], name: "index_hospits_on_veterinarian_id", using: :btree

  create_table "hospits_proprios", id: false, force: :cascade do |t|
    t.integer "proprio_id", null: false
    t.integer "hospit_id",  null: false
  end

  add_index "hospits_proprios", ["hospit_id"], name: "index_hospits_proprios_on_hospit_id", using: :btree
  add_index "hospits_proprios", ["proprio_id"], name: "index_hospits_proprios_on_proprio_id", using: :btree

  create_table "hospits_treatments", id: false, force: :cascade do |t|
    t.integer "hospit_id",    null: false
    t.integer "treatment_id", null: false
  end

  add_index "hospits_treatments", ["hospit_id"], name: "index_hospits_treatments_on_hospit_id", using: :btree
  add_index "hospits_treatments", ["treatment_id"], name: "index_hospits_treatments_on_treatment_id", using: :btree

  create_table "hospits_veterinarians", id: false, force: :cascade do |t|
    t.integer "veterinarian_id", null: false
    t.integer "hospit_id",       null: false
  end

  add_index "hospits_veterinarians", ["hospit_id"], name: "index_hospits_veterinarians_on_hospit_id", using: :btree
  add_index "hospits_veterinarians", ["veterinarian_id"], name: "index_hospits_veterinarians_on_veterinarian_id", using: :btree

  create_table "medical_records", force: :cascade do |t|
    t.text     "anamnesis"
    t.text     "description"
    t.text     "comment"
    t.integer  "proprio_id"
    t.integer  "veterinarian_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "poids"
    t.integer  "disease_id"
  end

  add_index "medical_records", ["disease_id"], name: "index_medical_records_on_disease_id", using: :btree
  add_index "medical_records", ["proprio_id"], name: "index_medical_records_on_proprio_id", using: :btree
  add_index "medical_records", ["veterinarian_id"], name: "index_medical_records_on_veterinarian_id", using: :btree

  create_table "medical_records_medicines", id: false, force: :cascade do |t|
    t.integer "medical_record_id", null: false
    t.integer "medicine_id",       null: false
  end

  add_index "medical_records_medicines", ["medical_record_id"], name: "index_medical_records_medicines_on_medical_record_id", using: :btree
  add_index "medical_records_medicines", ["medicine_id"], name: "index_medical_records_medicines_on_medicine_id", using: :btree

  create_table "medical_records_medocs", id: false, force: :cascade do |t|
    t.integer "medoc_id",          null: false
    t.integer "medical_record_id", null: false
  end

  add_index "medical_records_medocs", ["medical_record_id"], name: "index_medical_records_medocs_on_medical_record_id", using: :btree
  add_index "medical_records_medocs", ["medoc_id"], name: "index_medical_records_medocs_on_medoc_id", using: :btree

  create_table "medical_records_pictures", id: false, force: :cascade do |t|
    t.integer "medical_record_id", null: false
    t.integer "picture_id",        null: false
  end

  add_index "medical_records_pictures", ["medical_record_id"], name: "index_medical_records_pictures_on_medical_record_id", using: :btree
  add_index "medical_records_pictures", ["picture_id"], name: "index_medical_records_pictures_on_picture_id", using: :btree

  create_table "medical_records_proprios", id: false, force: :cascade do |t|
    t.integer "proprio_id",        null: false
    t.integer "medical_record_id", null: false
  end

  add_index "medical_records_proprios", ["medical_record_id"], name: "index_medical_records_proprios_on_medical_record_id", using: :btree
  add_index "medical_records_proprios", ["proprio_id"], name: "index_medical_records_proprios_on_proprio_id", using: :btree

  create_table "medical_records_treatments", id: false, force: :cascade do |t|
    t.integer "medical_record_id", null: false
    t.integer "treatment_id",      null: false
  end

  add_index "medical_records_treatments", ["medical_record_id"], name: "index_medical_records_treatments_on_medical_record_id", using: :btree
  add_index "medical_records_treatments", ["treatment_id"], name: "index_medical_records_treatments_on_treatment_id", using: :btree

  create_table "medical_records_veterinarians", id: false, force: :cascade do |t|
    t.integer "veterinarian_id",   null: false
    t.integer "medical_record_id", null: false
  end

  add_index "medical_records_veterinarians", ["medical_record_id"], name: "index_medical_records_veterinarians_on_medical_record_id", using: :btree
  add_index "medical_records_veterinarians", ["veterinarian_id"], name: "index_medical_records_veterinarians_on_veterinarian_id", using: :btree

  create_table "medicines", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "serial_number"
    t.text     "dosage"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "medoc_id"
  end

  add_index "medicines", ["medoc_id"], name: "index_medicines_on_medoc_id", using: :btree

  create_table "medicines_medocs", id: false, force: :cascade do |t|
    t.integer "medicine_id", null: false
    t.integer "medoc_id",    null: false
  end

  add_index "medicines_medocs", ["medicine_id"], name: "index_medicines_medocs_on_medicine_id", using: :btree
  add_index "medicines_medocs", ["medoc_id"], name: "index_medicines_medocs_on_medoc_id", using: :btree

  create_table "medocs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "proprio_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "image"
    t.integer  "animal_id"
  end

  add_index "pictures", ["animal_id"], name: "index_pictures_on_animal_id", using: :btree
  add_index "pictures", ["proprio_id"], name: "index_pictures_on_proprio_id", using: :btree

  create_table "proprios", force: :cascade do |t|
    t.datetime "remember_created_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "street"
    t.string   "house_number"
    t.string   "flat_number"
    t.string   "city"
    t.string   "country"
    t.string   "zip_code"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "searchas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "species", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  create_table "treatments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "cost"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status",      default: 0
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 0
    t.integer  "pesel"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "vacations", force: :cascade do |t|
    t.date     "start"
    t.date     "end"
    t.integer  "veterinarian_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "vacations", ["veterinarian_id"], name: "index_vacations_on_veterinarian_id", using: :btree

  create_table "veterinarians", force: :cascade do |t|
    t.string   "title"
    t.string   "specialization"
    t.string   "pwz"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "veterinarians", ["user_id"], name: "index_veterinarians_on_user_id", using: :btree

  create_table "working_days", force: :cascade do |t|
    t.integer  "veterinarian_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "monday",          default: false
    t.boolean  "tuesday",         default: false
    t.boolean  "wednesday",       default: false
    t.boolean  "thursday",        default: false
    t.boolean  "friday",          default: false
    t.boolean  "saturday",        default: false
    t.boolean  "sunday",          default: false
  end

  add_index "working_days", ["veterinarian_id"], name: "index_working_days_on_veterinarian_id", using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "animals", "proprios"
  add_foreign_key "animals", "species"
  add_foreign_key "comments", "veterinarians"
  add_foreign_key "hospitactes", "veterinarians"
  add_foreign_key "hospits", "diseases"
  add_foreign_key "hospits", "proprios"
  add_foreign_key "hospits", "veterinarians"
  add_foreign_key "medical_records", "diseases"
  add_foreign_key "medical_records", "proprios"
  add_foreign_key "medical_records", "veterinarians"
  add_foreign_key "medicines", "medocs"
  add_foreign_key "pictures", "animals"
  add_foreign_key "pictures", "proprios"
  add_foreign_key "vacations", "veterinarians"
  add_foreign_key "veterinarians", "users"
  add_foreign_key "working_days", "veterinarians"
end
