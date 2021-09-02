require 'faker'
require 'date'

# service model
# t.string "name"
# t.string "phone_number"
# t.string "predominant_disease"
# t.string "typical_workday"
# t.string "predominant_drugs"
#
puts "destroying services"
User.destroy_all
puts "destroying users"
Service.destroy_all
puts "destroying availabities"
Availability.destroy_all
puts "destroying missions"
Mission.destroy_all

puts "creating services"
service1 = Service.create(
  name: "Chirurgie Orthopédique",
  phone_number: "Anesthésiste du jour:,Dr Ducombs 05.45.34.34.34,Chirurgien du Rachis:,Dr Fabre  05.67.98.07.98,Chirurgien des membres inférieurs:,Dr Vital 05.67.56.76.16,Cadre de Santé :,Mme Genet  05.56.45.78.98,Réanimation: 05.34.54.34.18,Responsable plaie et cicatrisation:,Infirmière Maria :, 05.23.02.32.23",
  predominant_disease:"L’orthopédie est une spécialité chirurgicale qui permet de corriger les défauts de l’appareil locomoteur de nature congénitale ou acquise durant la croissance voire à l’âge adulte (os, articulations, muscles, tendons et nerfs).Elle comprend le traitement chirurgical des affections des membres supérieurs (épaule, coude et main), des membres inférieurs (hanche, genou, cheville et pied) et du rachis.",
  typical_workday:"- Transmissions orales et écrites avec l’équipe de nuit,- Vérification des dossiers de bloc, prémédications,- Bilans sanguins,- Dextro si patients diabétiques,- Prise des constantes,- Surveillance des perfusions,- Evaluation de la douleur,- Toilettes en collaboration avec les aides-soignantes,- Réfection des pansements selon protocole,- Transmissions écrites et orales avec l’équipe suivantes",
  predominant_drugs:"- Anti-inflammatoires,- Antalgiques,- PCA de morphine,- Anticoagulants,- Antibiotiques")

# Service.create(
#   name: "des urgences",
#   phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
#   predominant_disease: "fractures",
#   typical_workday: "6h45 - 14h",
#   predominant_drugs: "anti-douleurs"
# )
service2 = Service.create(
   name: "Urologie",
   phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
   predominant_disease: "inflamation",
   typical_workday: "6h45 - 14h",
   predominant_drugs: "antibiotique"
 )
# Service.create(
#   name: "des soins intensifs",
#   phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
#   predominant_disease: "brulures",
#   typical_workday: "6h45 - 14h",
#   predominant_drugs: "Cortisone"
# )
# Service.create(
#   name: "gastrologie",
#   phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
#   predominant_disease: "cancer",
#   typical_workday: "6h45 - 14h",
#   predominant_drugs: "Trastuzumab"
# )
puts "#{Service.count} service created"

# User model
# t.string "first_name"
# t.string "last_name"
# t.string "experience"
# t.string "speciality"
# t.string "phone_number"
# t.string "address"
# t.string "mail_address"
# t.string "service_admin"
# t.boolean "admin"

puts "creating users"
User.create(
  first_name: "Mathilde",
  last_name: "Sempéré",
  password: "123123",
  experience: " 8 ans de service ",
  speciality: " Chirurgie Orthopédique ",
  phone_number: "06.33.33.33.33",
  address: "107 rue Stuttenberg, Bordeaux",
  email: "mathilde-sempere@gmail.com",
  service_admin: "Orthopédie",
  admin: true,
  service: Service.first
)

User.create(
  first_name: "Justine",
  last_name: "baroque",
  password: "123123",
  experience: " 2 ans de service ",
  speciality: " Chirurgie Orthopédique ",
  phone_number: "06.33.33.33.28",
  address: "107 rue Stuttenberg, Bordeaux",
  email: "justinebaroque@gmail.com",
  service_admin: "Orthopédie",
  admin: false,
  service: Service.first
)

User.create(
  first_name: "Steve",
  last_name: "Madden",
  password: "123123",
  experience: " 2 ans de service ",
  speciality: " Urologie ",
  phone_number: "06.33.33.33.28",
  address: "107 rue Stuttenberg, Bordeaux",
  email: "Stevemadden@gmail.com",
  service_admin: "Urologie",
  admin: true,
  service: Service.second
)
30.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "000000",
    experience: "#{(1..30).to_a.sample}ans de service",
    speciality: %w[Chirurgie Orthopédique],
    phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    service_admin: "",
    admin: false,
    service: Service.all.sample
  )
end

puts "#{User.count} user created"

# t.date "date"
# t.bigint "user_id", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["user_id"], name: "index_availabilities_on_user_id"
puts "creating availabilities"
#100.times do
#  Availability.create(
#    date: Faker::Date.between(from: Date.today, to: 2.month.from_now),
#    user_id: User.all.sample.id
#  )
#end

puts "#{Availability.count} availabilities created"

# Mission model
# t.date "date"
# t.string "description"
# t.bigint "service_id", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["service_id"], name: "index_missions_on_service_id"
puts "creating missions"

#  Mission.create!(
#    date: Date.new(2021,9,4),
#    description: "renforts demandés",
#    service: service2
#  )
 puts "#{Mission.count} missions created"

Toxic.create!(name:'coca', total_quantity: 2, current_quantity: 1, service: service1, barcode: '5000112558265')
Toxic.create!(name:'gel hydroalcoolique', total_quantity: 2, current_quantity: 1, service: service1, barcode: '3518646213007')
Toxic.create!(name: 'sel', total_quantity: 2, current_quantity: 1, service: service1, barcode: '3560071184971')
