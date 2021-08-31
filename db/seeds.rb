require 'faker'

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
Service.create(
  name: "Orthopédique",
  phone_number: "06.33.33.33.33",
  predominant_disease: " ",
  typical_workday: "6h45 - 14h",
  predominant_drugs: "morphine"
)
Service.create(
  name: "cardiologique",
  phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
  predominant_disease: "coronaropathie",
  typical_workday: "6h45 - 14h",
  predominant_drugs: "antiarythmiques"
)
Service.create(
  name: "gériatrique",
  phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
  predominant_disease: "maladie d'Alzheimer",
  typical_workday: "6h45 - 14h",
  predominant_drugs: "Donépézil"
)
Service.create(
  name: "des urgences",
  phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
  predominant_disease: "fractures",
  typical_workday: "6h45 - 14h",
  predominant_drugs: "anti-douleurs"
)
Service.create(
  name: "urologique",
  phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
  predominant_disease: "inflamation",
  typical_workday: "6h45 - 14h",
  predominant_drugs: "antibiotique"
)
Service.create(
  name: "des soins intensifs",
  phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
  predominant_disease: "brûlures",
  typical_workday: "6h45 - 14h",
  predominant_drugs: "Cortisone"
)
Service.create(
  name: "gastrologique",
  phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
  predominant_disease: "cancer",
  typical_workday: "6h45 - 14h",
  predominant_drugs: "Trastuzumab"
)
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
  first_name: "Aymeric",
  last_name: "Maille",
  password: "123123",
  experience: "20ans de service",
  speciality: "orthopédie",
  phone_number: "06.33.33.33.33",
  address: "107 rue Stuttenberg, Bordeaux",
  email: "giorgio@gmail.com",
  service_admin: "orthopédie",
  admin: true,
  service: Service.first
)
30.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "000000",
    experience: "#{(1..30).to_a.sample}ans de service",
    speciality: %w[orthopédie cardiologie gériatrie urgences urologie soins-intensifs gastrologie].sample,
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
100.times do
  Availability.create(
    date: Faker::Date.between(from: Date.today, to: 2.month.from_now),
    user_id: User.all.sample.id
  )
end

puts "#{Availability.count} availabilities created"

# Mission model
# t.date "date"
# t.string "description"
# t.bigint "service_id", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["service_id"], name: "index_missions_on_service_id"
puts "creating missions"

100.times do
  service = Service.all.sample
  Mission.create!(
    date: Faker::Date.between(from: Date.today, to: 2.month.from_now),
    description: "renforts demandés au service #{service.name}",
    service_id: service.id
  )
end

puts "#{Mission.count} missions created"
