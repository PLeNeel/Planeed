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
Availabilitie.destroy_all
puts "destroying missions"
Mission.destroy_all

puts "creating services"
Service.create(
  name: "orthopédique",
  phone_number: "06.33.33.33.33",
  predominant_disease: "pieds cassés",
  typical_workday: "6h45 - 14h",
  predominant_drugs: "morphine"
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
User.create!(
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
puts "#{User.count} user created"

# t.date "date"
# t.bigint "user_id", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["user_id"], name: "index_availabilities_on_user_id"
puts "creating availabilities"

Availabilitie.create!(
  date: "09-09-2021",
  user_id: User.first.id
)
Availabilitie.create(
  date: "10-10-2021",
  user_id: User.first.id
)
Availabilitie.create(
  date: "10-09-2021",
  user_id: User.first.id
)

puts "#{Availabilitie.count} availabilities created"

# Mission model
# t.date "date"
# t.string "description"
# t.bigint "service_id", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["service_id"], name: "index_missions_on_service_id"
puts "creating missions"

Mission.create!(
  date: "09-09-2021",
  description: "renforts demandés en orthopédie",
  service_id: Service.first.id
)
Mission.create(
  date: "01-09-2021",
  description: "renforts demandés en orthopédie",
  service_id: Service.first.id
)
Mission.create(
  date: "09-10-2021",
  description: "renforts demandés en orthopédie",
  service_id: Service.first.id
)

puts "#{Mission.count} missions created"
