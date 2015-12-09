class CreateMedicalRecordsMedicinesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :medical_records, :medicines do |t|
      t.index :medicine_id
      t.index :medical_record_id
    end
  end
end
