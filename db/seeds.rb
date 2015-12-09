# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Veterinarians
veterinarian_user = User.new(first_name: 'Bob', last_name: 'Léponge', email: 'bobleponge@example.com', phone_number: '123456789', role: :veterinaire, password: 'password', password_confirmation: 'password')
veterinarian_user.skip_confirmation!
veterinarian_user.save!

veterinarian = Veterinarian.create!(title: 'Docteur', specialization: 'mouche des mers', pwz: '01234', user_id: veterinarian_user.id)

#Admin
admin = User.new(first_name: 'Admin', last_name: 'Administrator', email: 'administrator@example.com', phone_number: '123456780', role: :admin, password: 'password', password_confirmation: 'password')
admin.skip_confirmation!
admin.save!
#Species
chat = Species.create!(name: 'chat')
chien = Species.create!(name: 'chien')
cheval = Species.create!(name: 'cheval')
bovin = Species.create!(name: 'bovin')
cochon = Species.create!(name: 'porc')
Species.create!(name: 'ovin')
Species.create!(name: 'caprin')
Species.create!(name: 'abeille')
lapin = Species.create!(name: 'lapin')
Species.create!(name: 'oiseau')
Species.create!(name: 'gerbille')
poisson = Species.create!(name: 'poisson')

#Units
Unit.create!(name: 'kg')
g_unit = Unit.create!(name: 'g')
Unit.create!(name: 'mg')
Unit.create!(name: 'l')
ml_unit = Unit.create!(name: 'ml')
Unit.create!(name: 'plaquette')
Unit.create!(name: 'gélule')
Unit.create!(name: 'c.à café')
Unit.create!(name: 'C à soupe')
Unit.create!(name: 'dose')
Unit.create!(name: 'comprimé(s)')

#Diseases
Disease.create!(name: 'Tracheite')
Disease.create!(name: 'Pyomètre')
Disease.create!(name: 'Cystite')
Disease.create!(name: 'Boiterie')
Disease.create!(name: 'Dysplasie coxo-fémorale')
Disease.create!(name: 'Dysplasie du coude')
Disease.create!(name: 'Rupture LCR')
Disease.create!(name: 'DAPP')
Disease.create!(name: 'Toux du chenil')
Disease.create!(name: 'Parasitisme interne')
Disease.create!(name: 'Pyodermite')
Disease.create!(name: 'Tumeur')
Disease.create!(name: 'Leucémie')
Disease.create!(name: 'Insuffisance rénale')
Disease.create!(name: 'Calcul urinaire')

#medocs
Medoc.create!(name: 'Therios 60')
Medoc.create!(name: 'Rilexine 300')
Medoc.create!(name: 'Rilexine 600')
Medoc.create!(name: 'Previcox 227')
Medoc.create!(name: 'Previcox 57')
