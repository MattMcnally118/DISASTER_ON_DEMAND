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

# Create users
users = [
  {
    name: "John Smith",
    email: "john@example.com",
    password: "password123",
    location: "New York, NY",
    age: 32
  },
  {
    name: "Sarah Johnson",
    email: "sarah@example.com",
    password: "password123",
    location: "Los Angeles, CA",
    age: 28
  },
  {
    name: "Mike Chen",
    email: "mike@example.com",
    password: "password123",
    location: "Chicago, IL",
    age: 35
  },
  {
    name: "Emma Davis",
    email: "emma@example.com",
    password: "password123",
    location: "Miami, FL",
    age: 29
  },
  {
    name: "David Wilson",
    email: "david@example.com",
    password: "password123",
    location: "Seattle, WA",
    age: 41
  },
  {
    name: "Lisa Martinez",
    email: "lisa@example.com",
    password: "password123",
    location: "Austin, TX",
    age: 33
  },
  {
    name: "Robert Taylor",
    email: "robert@example.com",
    password: "password123",
    location: "Denver, CO",
    age: 37
  },
  {
    name: "Amanda Brown",
    email: "amanda@example.com",
    password: "password123",
    location: "Portland, OR",
    age: 26
  }
]

created_users = users.map do |user_data|
  User.create!(user_data)
end

puts "Created #{created_users.count} users"

puts "Creating disasters..."

# Create disasters
disasters_data = [
  {
    disaster_type: "Hurricane",
    name: "Hurricane Zara",
    location: "Gulf Coast, FL",
    description: "Experience the thrill of Category 3 hurricane winds! Perfect for adrenaline junkies who want to feel the raw power of nature. Includes secure bunker access and emergency supplies.",
    intensity: 3.2,
    price: 1299.99,
    user: created_users[0]
  },
  {
    disaster_type: "Earthquake",
    name: "San Andreas Shake",
    location: "San Francisco, CA",
    description: "Feel the earth move under your feet with this authentic 6.5 magnitude earthquake simulation. Includes seismic activity monitoring and structural engineering insights.",
    intensity: 6.5,
    price: 899.99,
    user: created_users[1]
  },
  {
    disaster_type: "Tornado",
    name: "Twister Alley Special",
    location: "Oklahoma City, OK",
    description: "Get up close and personal with an EF4 tornado! Our storm chasers will guide you safely through the experience. Includes storm shelter and weather tracking equipment.",
    intensity: 4.1,
    price: 1599.99,
    user: created_users[2]
  },
  {
    disaster_type: "Wildfire",
    name: "Inferno Experience",
    location: "Malibu, CA",
    description: "Witness the devastating beauty of a controlled wildfire. Learn about fire behavior while staying safe in our fireproof observation deck. Includes firefighting demonstration.",
    intensity: 3.8,
    price: 1099.99,
    user: created_users[3]
  },
  {
    disaster_type: "Tsunami",
    name: "Pacific Wave Rider",
    location: "Hilo, HI",
    description: "Experience the power of a 15-foot tsunami wave in our controlled environment. Perfect for understanding ocean dynamics and coastal safety. Includes surf gear and safety training.",
    intensity: 2.5,
    price: 1799.99,
    user: created_users[4]
  },
  {
    disaster_type: "Blizzard",
    name: "Arctic Blast Adventure",
    location: "Anchorage, AK",
    description: "Survive in extreme cold with 80mph winds and zero visibility! Learn survival skills while experiencing nature's frozen fury. Includes arctic gear and heated shelter.",
    intensity: 4.2,
    price: 999.99,
    user: created_users[5]
  },
  {
    disaster_type: "Volcano",
    name: "Lava Flow Encounter",
    location: "Big Island, HI",
    description: "Get as close as safely possible to active lava flows! Witness the birth of new land while learning about geological processes. Includes protective gear and volcanology guide.",
    intensity: 3.5,
    price: 2199.99,
    user: created_users[6]
  },
  {
    disaster_type: "Flood",
    name: "Rapids Rush",
    location: "New Orleans, LA",
    description: "Experience controlled flooding in our historic district replica. Learn about flood management and disaster response. Includes waterproof gear and rescue boat access.",
    intensity: 2.8,
    price: 799.99,
    user: created_users[7]
  },
  {
    disaster_type: "Hailstorm",
    name: "Ice Ball Barrage",
    location: "Denver, CO",
    description: "Duck and cover from golf ball-sized hail in our reinforced observation area. Perfect for weather enthusiasts and insurance adjusters. Includes impact-resistant gear.",
    intensity: 3.0,
    price: 699.99,
    user: created_users[0]
  },
  {
    disaster_type: "Sandstorm",
    name: "Desert Fury",
    location: "Phoenix, AZ",
    description: "Navigate through a massive dust storm with 60mph winds. Learn about desert survival and meteorology. Includes dust masks and GPS navigation training.",
    intensity: 2.7,
    price: 849.99,
    user: created_users[1]
  },
  {
    disaster_type: "Hurricane",
    name: "Category 5 Chaos",
    location: "Key West, FL",
    description: "The ultimate hurricane experience! Feel the fury of 175mph winds in our state-of-the-art hurricane simulator. Only for the most experienced disaster tourists.",
    intensity: 5.0,
    price: 2499.99,
    user: created_users[2]
  },
  {
    disaster_type: "Earthquake",
    name: "Richter Scale Rumble",
    location: "Los Angeles, CA",
    description: "A moderate 5.5 earthquake experience perfect for beginners. Learn about fault lines and seismic safety in California's earthquake country.",
    intensity: 5.5,
    price: 649.99,
    user: created_users[3]
  }
]

created_disasters = disasters_data.map do |disaster_data|
  Disaster.create!(disaster_data)
end

puts "Created #{created_disasters.count} disasters"

puts "Creating bookings..."

# Create bookings
bookings_data = [
  {
    start_date: Date.current + 5.days,
    end_date: Date.current + 7.days,
    user: created_users[4],
    disaster: created_disasters[0]
  },
  {
    start_date: Date.current + 10.days,
    end_date: Date.current + 12.days,
    user: created_users[5],
    disaster: created_disasters[1]
  },
  {
    start_date: Date.current + 15.days,
    end_date: Date.current + 17.days,
    user: created_users[6],
    disaster: created_disasters[2]
  },
  {
    start_date: Date.current + 20.days,
    end_date: Date.current + 22.days,
    user: created_users[7],
    disaster: created_disasters[3]
  },
  {
    start_date: Date.current + 25.days,
    end_date: Date.current + 28.days,
    user: created_users[0],
    disaster: created_disasters[4]
  },
  {
    start_date: Date.current + 30.days,
    end_date: Date.current + 32.days,
    user: created_users[1],
    disaster: created_disasters[5]
  },
  {
    start_date: Date.current + 35.days,
    end_date: Date.current + 37.days,
    user: created_users[2],
    disaster: created_disasters[6]
  },
  {
    start_date: Date.current + 40.days,
    end_date: Date.current + 42.days,
    user: created_users[3],
    disaster: created_disasters[7]
  },
  {
    start_date: Date.current + 45.days,
    end_date: Date.current + 46.days,
    user: created_users[4],
    disaster: created_disasters[8]
  },
  {
    start_date: Date.current + 50.days,
    end_date: Date.current + 52.days,
    user: created_users[5],
    disaster: created_disasters[9]
  },
  {
    start_date: Date.current - 10.days,
    end_date: Date.current - 8.days,
    user: created_users[6],
    disaster: created_disasters[0]
  },
  {
    start_date: Date.current - 20.days,
    end_date: Date.current - 18.days,
    user: created_users[7],
    disaster: created_disasters[1]
  },
  {
    start_date: Date.current + 60.days,
    end_date: Date.current + 63.days,
    user: created_users[0],
    disaster: created_disasters[10]
  },
  {
    start_date: Date.current + 65.days,
    end_date: Date.current + 67.days,
    user: created_users[1],
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
puts "- Disasters: #{Disaster.count}"
puts "- Bookings: #{Booking.count}"
