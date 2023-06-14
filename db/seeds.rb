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
      description: 'Um coletivo de música eletrônica inovador, unindo batidas pulsantes e melodias cativantes em uma fusão sonora única. Suas performances hipnotizantes transmitem uma energia contagiante que envolve o público, transportando-o para uma jornada eletrizante através de paisagens sonoras vanguardistas. Um movimento que transcende fronteiras musicais e conecta pessoas através da paixão pela música eletrônica.',
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
  # create an invite
  Membership.create!(user:, collective: uzalemaun, accepted: false)

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
    { name: 'acid house' },
    { name: 'afrohouse' },
    { name: 'amapiano' },
    { name: 'bass' },
    { name: 'breakbeat' },
    { name: 'dance' },
    { name: 'deep house' },
    { name: 'deep tech' },
    { name: 'disco' },
    { name: 'drum & bass' },
    { name: 'dubstep' },
    { name: 'electro' },
    { name: 'electronica' },
    { name: 'funky house' },
    { name: 'grime' },
    { name: 'hard dance' },
    { name: 'hard techno' },
    { name: 'hardgroove' },
    { name: 'house' },
    { name: 'hypnotic tecnho' },
    { name: 'indie dance' },
    { name: 'jackin house' },
    { name: 'jungle' },
    { name: 'melodic techno' },
    { name: 'minimal' },
    { name: 'nu disco' },
    { name: 'organic house' },
    { name: 'peak-time' },
    { name: 'progressive house' },
    { name: 'psy-trance' },
    { name: 'tech house' },
    { name: 'techno' },
    { name: 'trance' },
    { name: 'trap' },
    { name: 'uk garage' }
  ]
)
genres = Genre.all
events = Event.all
collectives = Collective.all

puts 'Assigning genres to the collectives...'
collectives.each do |collective|
  random_genres = genres.sample(4)
  random_genres.each do |genre|
    CollectiveGenre.create!(collective:, genre:)
  end
end

puts 'Assigning genres to the events...'
events.each do |event|
  random_genres = genres.sample(4)
  random_genres.each do |genre|
    EventGenre.create!(event:, genre:)
  end
end

######################################################################
puts 'Finished!'
