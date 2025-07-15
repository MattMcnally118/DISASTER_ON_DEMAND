# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
puts "Clearing existing data..."
Booking.destroy_all
Disaster.destroy_all
User.destroy_all

puts "Creating users..."

# Create users with varying roles
users = [
  {
    name: "John Smith",
    email: "john@example.com",
    password: "password123",
    location: "New York, NY",
    age: 32,
    role: :owner  # Owner
  },
  {
    name: "Sarah Johnson",
    email: "sarah@example.com",
    password: "password123",
    location: "Los Angeles, CA",
    age: 28,
    role: :owner  # Owner
  },
  {
    name: "Mike Chen",
    email: "mike@example.com",
    password: "password123",
    location: "Chicago, IL",
    age: 35,
    role: :visitor  # Visitor
  },
  {
    name: "Emma Davis",
    email: "emma@example.com",
    password: "password123",
    location: "Miami, FL",
    age: 29,
    role: :visitor  # Visitor
  },
  {
    name: "David Wilson",
    email: "david@example.com",
    password: "password123",
    location: "Seattle, WA",
    age: 41,
    role: :owner  # Owner
  },
  {
    name: "Lisa Martinez",
    email: "lisa@example.com",
    password: "password123",
    location: "Austin, TX",
    age: 33,
    role: :visitor  # Visitor
  },
  {
    name: "Robert Taylor",
    email: "robert@example.com",
    password: "password123",
    location: "Denver, CO",
    age: 37,
    role: :visitor  # Visitor
  },
  {
    name: "Amanda Brown",
    email: "amanda@example.com",
    password: "password123",
    location: "Portland, OR",
    age: 26,
    role: :visitor  # Visitor
  }
]

created_users = users.map do |user_data|
  User.create!(user_data)
end

puts "Created #{created_users.count} users"
puts "- Owners: #{User.owner.count}"
puts "- Visitors: #{User.visitor.count}"

puts "Creating disasters..."

# Create disasters (only assign to owners)
disaster_owners = created_users.select(&:owner?)

disasters_data = [
  {
    disaster_type: "Hurricane",
    name: "Hurricane Zara",
    location: "Gulf Coast, FL",
    description: "Experience the thrill of Category 3 hurricane winds! Perfect for adrenaline junkies who want to feel the raw power of nature. Includes secure bunker access and emergency supplies.",
    intensity: 3.2,
    price: 1299.99,
    user: disaster_owners[0]  # John Smith (owner)
  },
  {
    disaster_type: "Earthquake",
    name: "San Andreas Shake",
    location: "San Francisco, CA",
    description: "Feel the earth move under your feet with this authentic 6.5 magnitude earthquake simulation. Includes seismic activity monitoring and structural engineering insights.",
    intensity: 6.5,
    price: 899.99,
    user: disaster_owners[1]  # Sarah Johnson (owner)
  },
  {
    disaster_type: "Tornado",
    name: "Twister Alley Special",
    location: "Oklahoma City, OK",
    description: "Get up close and personal with an EF4 tornado! Our storm chasers will guide you safely through the experience. Includes storm shelter and weather tracking equipment.",
    intensity: 4.1,
    price: 1599.99,
    user: disaster_owners[2]  # David Wilson (owner)
  },
  {
    disaster_type: "Wildfire",
    name: "Inferno Experience",
    location: "Malibu, CA",
    description: "Witness the devastating beauty of a controlled wildfire. Learn about fire behavior while staying safe in our fireproof observation deck. Includes firefighting demonstration.",
    intensity: 3.8,
    price: 1099.99,
    user: disaster_owners[0]  # John Smith (owner)
  },
  {
    disaster_type: "Tsunami",
    name: "Pacific Wave Rider",
    location: "Hilo, HI",
    description: "Experience the power of a 15-foot tsunami wave in our controlled environment. Perfect for understanding ocean dynamics and coastal safety. Includes surf gear and safety training.",
    intensity: 2.5,
    price: 1799.99,
    user: disaster_owners[1]  # Sarah Johnson (owner)
  },
  {
    disaster_type: "Blizzard",
    name: "Arctic Blast Adventure",
    location: "Anchorage, AK",
    description: "Survive in extreme cold with 80mph winds and zero visibility! Learn survival skills while experiencing nature's frozen fury. Includes arctic gear and heated shelter.",
    intensity: 4.2,
    price: 999.99,
    user: disaster_owners[2]  # David Wilson (owner)
  },
  {
    disaster_type: "Volcano",
    name: "Lava Flow Encounter",
    location: "Big Island, HI",
    description: "Get as close as safely possible to active lava flows! Witness the birth of new land while learning about geological processes. Includes protective gear and volcanology guide.",
    intensity: 3.5,
    price: 2199.99,
    user: disaster_owners[0]  # John Smith (owner)
  },
  {
    disaster_type: "Flood",
    name: "Rapids Rush",
    location: "New Orleans, LA",
    description: "Experience controlled flooding in our historic district replica. Learn about flood management and disaster response. Includes waterproof gear and rescue boat access.",
    intensity: 2.8,
    price: 799.99,
    user: disaster_owners[1]  # Sarah Johnson (owner)
  },
  {
    disaster_type: "Hailstorm",
    name: "Ice Ball Barrage",
    location: "Denver, CO",
    description: "Duck and cover from golf ball-sized hail in our reinforced observation area. Perfect for weather enthusiasts and insurance adjusters. Includes impact-resistant gear.",
    intensity: 3.0,
    price: 699.99,
    user: disaster_owners[2]  # David Wilson (owner)
  },
  {
    disaster_type: "Sandstorm",
    name: "Desert Fury",
    location: "Phoenix, AZ",
    description: "Navigate through a massive dust storm with 60mph winds. Learn about desert survival and meteorology. Includes dust masks and GPS navigation training.",
    intensity: 2.7,
    price: 849.99,
    user: disaster_owners[0]  # John Smith (owner)
  },
  {
    disaster_type: "Hurricane",
    name: "Category 5 Chaos",
    location: "Key West, FL",
    description: "The ultimate hurricane experience! Feel the fury of 175mph winds in our state-of-the-art hurricane simulator. Only for the most experienced disaster tourists.",
    intensity: 5.0,
    price: 2499.99,
    user: disaster_owners[1]  # Sarah Johnson (owner)
  },
  {
    disaster_type: "Earthquake",
    name: "Richter Scale Rumble",
    location: "Los Angeles, CA",
    description: "A moderate 5.5 earthquake experience perfect for beginners. Learn about fault lines and seismic safety in California's earthquake country.",
    intensity: 5.5,
    price: 649.99,
    user: disaster_owners[2]  # David Wilson (owner)
  }
]

created_disasters = disasters_data.map do |disaster_data|
  Disaster.create!(disaster_data)
end

puts "Created #{created_disasters.count} disasters"

puts "Creating bookings..."

# Create bookings (only visitors can book disasters)
visitor_users = created_users.select(&:visitor?)

bookings_data = [
  {
    start_date: Date.current + 5.days,
    end_date: Date.current + 7.days,
    user: visitor_users[0],  # Mike Chen (visitor)
    disaster: created_disasters[0]
  },
  {
    start_date: Date.current + 10.days,
    end_date: Date.current + 12.days,
    user: visitor_users[1],  # Emma Davis (visitor)
    disaster: created_disasters[1]
  },
  {
    start_date: Date.current + 15.days,
    end_date: Date.current + 17.days,
    user: visitor_users[2],  # Lisa Martinez (visitor)
    disaster: created_disasters[2]
  },
  {
    start_date: Date.current + 20.days,
    end_date: Date.current + 22.days,
    user: visitor_users[3],  # Robert Taylor (visitor)
    disaster: created_disasters[3]
  },
  {
    start_date: Date.current + 25.days,
    end_date: Date.current + 28.days,
    user: visitor_users[4],  # Amanda Brown (visitor)
    disaster: created_disasters[4]
  },
  {
    start_date: Date.current + 30.days,
    end_date: Date.current + 32.days,
    user: visitor_users[0],  # Mike Chen (visitor)
    disaster: created_disasters[5]
  },
  {
    start_date: Date.current + 35.days,
    end_date: Date.current + 37.days,
    user: visitor_users[1],  # Emma Davis (visitor)
    disaster: created_disasters[6]
  },
  {
    start_date: Date.current + 40.days,
    end_date: Date.current + 42.days,
    user: visitor_users[2],  # Lisa Martinez (visitor)
    disaster: created_disasters[7]
  },
  {
    start_date: Date.current + 45.days,
    end_date: Date.current + 46.days,
    user: visitor_users[3],  # Robert Taylor (visitor)
    disaster: created_disasters[8]
  },
  {
    start_date: Date.current + 50.days,
    end_date: Date.current + 52.days,
    user: visitor_users[4],  # Amanda Brown (visitor)
    disaster: created_disasters[9]
  },
  {
    start_date: Date.current - 10.days,
    end_date: Date.current - 8.days,
    user: visitor_users[0],  # Mike Chen (visitor)
    disaster: created_disasters[0]
  },
  {
    start_date: Date.current - 20.days,
    end_date: Date.current - 18.days,
    user: visitor_users[1],  # Emma Davis (visitor)
    disaster: created_disasters[1]
  },
  {
    start_date: Date.current + 60.days,
    end_date: Date.current + 63.days,
    user: visitor_users[2],  # Lisa Martinez (visitor)
    disaster: created_disasters[10]
  },
  {
    start_date: Date.current + 65.days,
    end_date: Date.current + 67.days,
    user: visitor_users[3],  # Robert Taylor (visitor)
    disaster: created_disasters[11]
  }
]

created_bookings = bookings_data.map do |booking_data|
  Booking.create!(booking_data)
end

puts "Created #{created_bookings.count} bookings"

puts "Seeding completed successfully!"
puts "Summary:"
puts "- Users: #{User.count}"
puts "  - Owners: #{User.owner.count}"
puts "  - Visitors: #{User.visitor.count}"
puts "- Disasters: #{Disaster.count}"
puts "- Bookings: #{Booking.count}"

puts "\nTest login credentials:"
puts "Owner accounts:"
puts "  - john@example.com / password123 (John Smith)"
puts "  - sarah@example.com / password123 (Sarah Johnson)"
puts "  - david@example.com / password123 (David Wilson)"
puts "\nVisitor accounts:"
puts "  - mike@example.com / password123 (Mike Chen)"
puts "  - emma@example.com / password123 (Emma Davis)"
puts "  - lisa@example.com / password123 (Lisa Martinez)"
puts "  - robert@example.com / password123 (Robert Taylor)"
puts "  - amanda@example.com / password123 (Amanda Brown)"
