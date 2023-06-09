require 'open-uri'

CollectiveGenre.destroy_all
Genre.destroy_all
Collective.destroy_all
User.destroy_all

# USERS
######################################################################
puts 'Creating some users...'
User.create!(
  [
    {
      name: 'meleu',
      password: 'asdfgçlkjh',
      email: 'meleu@temrole.org'
    },
    {
      name: 'douglasgpassos',
      password: 'asdfgçlkjh',
      email: 'douglas@temrole.org'
    },
    {
      name: 'marcosgabriel-smc',
      password: 'asdfgçlkjh',
      email: 'marcos@temrole.org'
    },
    {
      name: 'ze',
      password: 'asdfgçlkjh',
      email: 'ze@temrole.org'
    }
  ]
)
lewagang_owner = User.first
uzalemaum_owner = User.last

# COLLECTIVES
######################################################################
puts 'Creating collectives...'
Collective.create!(
  [
    {
      name: 'lewagang',
      description: 'mix masters pika das galaxias deluxe loren sajdlasjk jsdiowj lakdfka joiwej rqlk jrli lkehr  uasdh oa dowaha oiwh ethoi dlfh oie iroq niaekj nlaje eja flkdmj flj emdaç f jpaje ajkfea jaelk dgf osei jgsf kdslsj dfçg fkj ds k j',
      city: 'rio de janeiro',
      state: 'RJ',
      owner: lewagang_owner
    },
    {
      name: 'uzalemaum',
      description: 'so tem pelasako',
      city: 'rio de janeiro',
      state: 'RJ',
      owner: uzalemaum_owner
    }
  ]
)
lewagang = Collective.first
uzalemaun = Collective.last

collective_names = [
  "Pulse Syndicate",
  "Rhythm Rebellion",
  "Techno Tribe",
  "Beat Architects",
  "Bass Battalion",
  "Synthwave Society",
  "Groove Gurus",
  "Digital Nexus",
  "Techno Fusion",
  "Electric Ecstasy",
  "Underground Utopia",
  "Sonic Sanctuary",
  "Circuit Cartel",
  "Techno Titans",
  "Future Frequency",
  "Machine Manifesto",
  "Synaptic Soundscape",
  "Modular Movement",
  "The Techno Nexus",
  "Vaporwave City"
]
lorem = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repellat earum sequi consequatur officiis inventore aut, sunt, maxime quis voluptate tempora error eaque eos nisi, voluptatem libero fugiat? Vero, quidem quia?'

collective_names.each do |name|
  owner = User.all.sample
  Collective.create!(
    {
      name:,
      description: lorem,
      city: 'any city',
      state: Event::STATES.sample,
      owner:
    }
  )
end

puts 'Uploading images to cloudinary...'

banner1 = URI.open("https://art.ngfiles.com/images/1088000/1088037_twosipsofbleach_new-banner-icon.png?f1574212770")
lewagang.banner.attach(io: banner1, filename: "banner.png", content_type: "image/png")
logo1 = URI.open("https://i.imgur.com/LL69Go8.png")
lewagang.logo.attach(io: logo1, filename: "logo1.png", content_type: "image/png")
lewagang.save

banner2 = URI.open("https://art.ngfiles.com/images/1088000/1088037_twosipsofbleach_new-banner-icon.png?f1574212770")
uzalemaun.banner.attach(io: banner2, filename: "banner2.png", content_type: "image/png")
logo2 = URI.open("https://art.ngfiles.com/comments/70000/iu_70834_7446245.jpg")
uzalemaun.logo.attach(io: logo2, filename: "logo2.png", content_type: "image/png")
uzalemaun.save

# MEMBERSHIP
######################################################################
User.first(3).each do |user|
  # the owner is automatically set as a member
  next if user == lewagang.owner

  Membership.create!(user:, collective: lewagang, accepted: true)
end

# EVENTS
######################################################################
puts "Creating some events..."
20.times do |i|
  collective = (i % 3).zero? ? Collective.last : Collective.first
  Event.create!(
    collective:,
    name: "Party #{i}",
    description: "This is the version #{i} of an awesome party!",
    start_time: DateTime.current + i,
    end_time: DateTime.tomorrow + i,
    state: Event::STATES.sample
  )
end

# GENRES
######################################################################
puts 'Creating some genres...'
Genre.create!(
  [
    { name: 'house' },
    { name: 'trance' },
    { name: 'drum&bass' },
    { name: 'techno' },
    { name: 'hard techno' },
    { name: 'jungle' },
    { name: 'acid house' },
    { name: 'dubstep' }
  ]
)
genres = Genre.all
events = Event.all
collectives = Collective.all

puts 'Assigning genres to the collectives...'
collectives.each do |collective|
  CollectiveGenre.create!(collective:, genre: genres.sample)
end

puts 'Assigning genres to the events...'

events.each do |event|
  EventGenre.create!(event:, genre: genres.sample)
end

######################################################################
puts 'Finished!'
