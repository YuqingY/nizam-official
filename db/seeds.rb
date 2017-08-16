# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Destroying old data"
Ticket.destroy_all
User.destroy_all
p"Seeding new data"

puts "Making 3 users manager and cs rep"
User.create(email: 'manager@nizam.com', password:"12345678", position:'manager', name:'manager')
csrep1 = User.create(email: 'csrep1@nizam.com', password:"12345678", position:'csrep', name:'csrep1')
csrep2 = User.create(email: 'csrep2@nizam.com', password:"12345678", position:'csrep', name:'csrep2')
external = User.create(email: 'external@nizam.com', password:"12345678", position:'external', name:'external')
puts "Finished creating users"

puts "creating new tickets"
Ticket.create(customer_id:"1", author_id: csrep1.id, category:'tech', department:"tech", status:"new")
Ticket.create(customer_id:"2", author_id: csrep2.id, category:'tech', department:"tech", status:"new")
Ticket.create(customer_id:"3", author_id: csrep1.id, category:'tech', department:"tech", status:"active")
Ticket.create(customer_id:"4", author_id: csrep2.id, category:'tech', department:"tech", status:"active")
Ticket.create(customer_id:"5", author_id: csrep1.id, category:'tech', department:"tech", status:"pending")
Ticket.create(customer_id:"5", author_id: csrep2.id, category:'info', department:"sale", status:"pending")
Ticket.create(customer_id:"6", author_id: csrep1.id, category:'info', department:"sale", status:"ready")
Ticket.create(customer_id:"7", author_id: csrep2.id, category:'sale', department:"sale", status:"ready")
Ticket.create(customer_id:"8", author_id: csrep1.id, category:'sale', department:"sale", status:"closed")
Ticket.create(customer_id:"7", author_id: csrep2.id, category:'sale', department:"sale", status:"closed")
puts "done"

require 'csv'
csv_text = File.read(Rails.root.join('db' , 'nizamdata2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  # puts row.to_hash
  t = Ticket.new
  t.customer_id = row['customer_cnic']
  t.imei = row['imei_number']
  puts t.save
  puts "#{t.customer_id}, #{t.imei} saved"
end
