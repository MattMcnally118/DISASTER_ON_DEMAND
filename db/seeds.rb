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
Review.destroy_all
Booking.destroy_all
Disaster.destroy_all
User.destroy_all

puts "Creating users..."

user_images = [
  "https://www.americanacademy.de/wp-content/uploads/2019/02/Smith-John-E..jpg",
  "https://pbs.twimg.com/profile_images/1271544502340198400/8Fq7zjbq_400x400.jpg",
  "https://res.cloudinary.com/dxw0o8aaj/image/upload/c_crop/v1683954154/explorer_profiles/mike_chen.png",
  "https://pbs.twimg.com/profile_images/1589417994580643840/AnOOpDRX_400x400.jpg",
  "https://s3media.247sports.com/Uploads/Assets/577/27/3027577.jpg",
  "https://s3media.247sports.com/Uploads/Assets/577/27/3027577.jpg",
  "https://i.redd.it/t202er8ae6f51.jpg",
  "https://pbs.twimg.com/profile_images/1317795886701969408/i9inMUiu_400x400.jpg"
]

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

created_users = users.each_with_index.map do |user_data, i|
  user = User.create!(user_data)
  image_url = user_images[i]
  file = URI.open(image_url)
  user.photo.attach(io: file, filename: "user_#{i + 1}.jpg", content_type: "image/jpeg")
  user
end

puts "Created #{created_users.count} users"
puts "- Owners: #{User.owner.count}"
puts "- Visitors: #{User.visitor.count}"

puts "Creating disasters..."

# Create disasters (only assign to owners)
disaster_owners = created_users.select(&:owner?)

# Add Cloudinary image URLs (you can change these with your own links)
disaster_images = [
  "https://antigua.news/wp-content/uploads/2023/04/Hurricane.jpg",
  "https://www.livemint.com/lm-img/img/2025/03/29/1600x900/AP03-28-2025-000504A-0_1743211425378_1743211434760.jpg",
  "https://news.northeastern.edu/wp-content/uploads/2025/05/Storms1400.jpg",
  "https://news.uga.edu/wp-content/uploads/2022/08/Oregon-forest-fire.jpg",
  "https://gumlet.assettype.com/downtoearth%2F2024-12-26%2F9gv1ljfs%2Ftsunami.jpg?format=auto",
  "https://ca-times.brightspotcdn.com/dims4/default/d6e85dc/2147483647/strip/true/crop/5285x3356+0+0/resize/2000x1270!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F1c%2Fd0%2Fa3866a5a41bf982629ed84d51d93%2Fgettyimages-2052025262.jpg",
  "https://images.newscientist.com/wp-content/uploads/2020/12/21145328/volcanoes-f0r7pt_web.jpg",
  "https://www.munichre.com/content/dam/munichre/global/images/royalty-free/GettyImages-1497485073.jpg/_jcr_content/renditions/original.image_file.4080.2295.0,389,4080,2684.file/GettyImages-1497485073.jpg",
  "https://www.onithome.com/wp-content/uploads/2021/06/hail-1.jpg",
  "https://purple-cdn.web-apps-prod.wo-cloud.com/purple/0f7a645f-e3c1-4a9c-a6dd-ccfa5dff68a7/ccaeda65-166e-49c6-bbcd-ece973f0339c/9253edfa-5c39-44d0-b898-e0d677a95ae2/cab3f771-32f0-4f3f-9e0e-96e575d9aa80.jpg",
  "https://www.americanoceans.org/wp-content/uploads/2021/03/Hurricane.jpg",
  "https://s.france24.com/media/display/07565fe4-a781-11ed-ac33-005056a90321/w:1280/p:16x9/58d836d4f263cf3eaa8322a0698dba38b826ffa8.jpg"
]

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

created_disasters = disasters_data.each_with_index.map do |disaster_data, i|
  disaster = Disaster.create!(disaster_data)
  image_url = disaster_images[i]
  file = URI.open(image_url)
  disaster.photo.attach(io: file, filename: "disaster_#{i + 1}.jpg", content_type: "image/jpeg")
  disaster
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
