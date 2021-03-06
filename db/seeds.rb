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
p "Database Clean"
# p"Seeding new data"
# puts"getting the file"
# require 'csv'
# csv_text = File.read(Rails.root.join('db' , 'nizamdata.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# puts 'creating customers'
# csv.each do |row|
#   # puts row.to_hash
#   c = Customer.new
#   c.name = row['customer_name']
#   c.cnic = row['customer_cnic']
#   c.imei = row['imei_number']
#   c.save
# end
# puts "Customers created"
# puts "Creating fake customer for default ticket"
# fake_customer = Customer.create(name: 'N/A', cnic:"N/A", imei:"N/A")
# puts "fake customer created"

puts "Making manager account"
User.create(email: 'manager@nizam.com', password:"12345678", position:'manager', name:'manager', admin: true)
# csrep1 = User.create(email: 'csrep1@nizam.com', password:"12345678", position:'csrep', name:'Monica', desc:'Keep calm and go diving!')
# csrep2 = User.create(email: 'csrep2@nizam.com', password:"12345678", position:'csrep', name:'Zoey', desc:"Be a voice, not an echo")
# csrep3 = User.create(email: 'csrep3@nizam.com', password:"12345678", position:'csrep', name:'Louis', desc:'Focus on the good')
# csrep4 = User.create(email: 'csrep4@nizam.com', password:"12345678", position:'csrep', name:'Justin', desc:'Prove them wrong!')
# csrep5 = User.create(email: 'csrep5@nizam.com', password:"12345678", position:'csrep', name:'Rachel', desc:'Do it with passion!')
# external = User.create(email: 'external@nizam.com', password:"12345678", position:'external', name:'external')
# puts "Finished creating users"

puts "done"


# 75.times do
#   customer = Customer.all.sample
#   customer_cnic = customer.cnic
#   imei =  customer.imei
#   author_id = [csrep1.id, csrep2.id, csrep3.id, csrep4.id, csrep5.id].sample
#   assignee_id =  [csrep1.id, csrep2.id, csrep3.id, csrep4.id, csrep5.id, '', '', ''].sample
#   cat_array = [['tech issues', 'technology', 'The machine is plugged in but not working', 'Waiting for Tech dep'],
#                ['sales','sales', 'Ask for further discount on the second device', 'sales team: callback'],
#                ['information','sales', 'General info about the company', 'send info pack'],
#                ['payment', 'support', 'late payment, will be paid latest this Friday','follow up this Friday'],
#                ['repair', 'support', 'The is a leak that need to be fixed', 'repair team sent'],
#                ['cancel service', 'customer service', 'Not satisfied, can not afford it anymore','send low-income aid package']].sample
#   status = ['new', 'active', 'pending', 'ready', 'closed', 'closed', 'closed'].sample
#   created_at = Time.zone.now.ago(rand(1...168).hours)
#   response_time = [1000, 90000, 3600, 3800, 17000, 16000, 15000, 16000, 17520, 18300, 38240, 80000, 70000, 60000, 12000].sample
#   resolve_time = [5400, 86000, 100000, 200000, 380000, 82000, 72000, 300000].sample
#   Ticket.create(imei: imei, customer_cnic: customer_cnic, author_id: author_id, category:cat_array[0], department:cat_array[1], description: cat_array[2], next_step:cat_array[3], status:status, created_at:created_at, assignee_id: assignee_id, resolve_time: resolve_time, response_time:response_time)
# end

# puts "creating new calls"
# Ticket.all.each do |t|
#   user_id = t.author_id
#   duration = [70, 80, 360, 500, 300, 400, 1900, 1500, 600, 700, 800, 750, 720, 830, 550].sample
#   created_at = t.created_at
#   Call.create(user_id: user_id, duration: duration, ticket_id: t.id, created_at: created_at)
# end
# tickets_id = []
# Ticket.all.each { |t| tickets_id << t.id }
# 40.times do
#   duration = [70, 80, 360, 500, 300, 400, 1900, 1500, 600, 700, 800, 750, 720, 830, 550].sample
#   ticket_id = tickets_id.sample
#   created_at = Ticket.find(ticket_id).created_at
#   user_id = [csrep1.id, csrep2.id, csrep3.id, csrep4.id, csrep5.id].sample
#   Call.create(user_id: user_id, duration: duration, ticket_id: ticket_id, created_at: Time.zone.now)
# end


# puts "setting current_state"
# User.all.each do |user|
#   ticket = 'Ticket' + tickets_id.sample.to_s
#   current_state = ['Idle', 'OnCall', 'OffDuty', ticket]
#   user.current_state = current_state
# end




