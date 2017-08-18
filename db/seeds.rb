# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Destroying old data"
Call.destroy_all
Ticket.destroy_all
Customer.destroy_all
User.destroy_all
p"Seeding new data"
puts"getting the file"
require 'csv'
csv_text = File.read(Rails.root.join('db' , 'nizamdata.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
puts 'creating customers'
csv.each do |row|
  # puts row.to_hash
  c = Customer.new
  c.name = row['customer_name']
  c.cnic = row['customer_cnic']
  c.imei = row['imei_number']
  c.save
end
puts "Customers created"
puts "Creating fake customer for default ticket"
fake_customer = Customer.create(name: 'N/A', cnic:"N/A", imei:"N/A")
puts "fake customer created"

puts "Making 3 users manager and cs rep"
User.create(email: 'manager@nizam.com', password:"12345678", position:'manager', name:'manager', admin: true)
csrep1 = User.create(email: 'csrep1@nizam.com', password:"12345678", position:'csrep', name:'csrep1')
csrep2 = User.create(email: 'csrep2@nizam.com', password:"12345678", position:'csrep', name:'csrep2')
external = User.create(email: 'external@nizam.com', password:"12345678", position:'external', name:'external')
puts "Finished creating users"

puts "creating new tickets"
Customer.all.each do |c|
  author_id = [csrep1.id, csrep2.id].sample
  category = ['tech issues', 'sales', 'information', 'payment', 'repair', 'cancel servie'].sample
  department = ['technology', 'sales', 'support', 'field'].sample
  status = ['new', 'active', 'pending', 'ready', 'closed'].sample
  Ticket.create(customer_cnic: c.cnic, author_id: author_id, category:category, department:department, status:status)
end
puts "done"




