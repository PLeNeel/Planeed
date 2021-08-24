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

puts "creating services"
Service.create(
  name: "orthopédique",
  phone_number: "06.33.33.33.33",
  predominant_disease:  "pieds cassés",
  typical_workday: "6h45 - 14h",
  predominant_drugs: "morphine"
)
puts "#{Service.count} service created"

#     # User model
#     # t.string "first_name"
#     # t.string "last_name"
#     # t.string "experience"
#     # t.string "speciality"
#     # t.string "phone_number"
#     # t.string "address"
#     # t.string "mail_address"
#     # t.string "service_admin"
#     # t.boolean "admin"

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
