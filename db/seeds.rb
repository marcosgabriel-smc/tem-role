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
      username: 'meleu',
      first_name: 'Augusto',
      last_name: 'Lopes',
      password: 'asdfgçlkjh',
      email: 'meleu@temrole.org'
    },
    {
      username: 'douglasgpassos',
      first_name: 'Douglas',
      last_name: 'Passos',
      password: 'asdfgçlkjh',
      email: 'douglas@temrole.org'
    },
    {
      username: 'marcosgabriel-smc',
      first_name: 'Marcos',
      last_name: 'Costa',
      password: 'asdfgçlkjh',
      email: 'marcos@temrole.org'
    },
    {
      username: 'zelele',
      first_name: 'José',
      last_name: 'Ferreira',
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

## EVENTS IN RIO
rio_de_janeiro = { city: "Rio de Janeiro", state: "RJ" }
collectives_in_rio = Collective.order(created_at: :asc).first(5)

collectives_in_rio.each do |collective|
  # Create incoming events
  5.times do
    n = rand(1..10)
    Event.create!(
      collective: collective,
      name: Faker::Book.title,
      description: Faker::Lorem.paragraphs,
      start_time: DateTime.current + n,
      end_time: DateTime.tomorrow + n,
      address: "R. Cordeiro da Graça - Santo Cristo - Rio de Janeiro - RJ",
      city: rio_de_janeiro[:city],
      state: rio_de_janeiro[:state]
    )
  end
  # Create previous events
  3.times do
    n = rand(1..10)
    Event.new(
      collective: collective,
      name: Faker::Book.title,
      description: Faker::Lorem.paragraphs,
      start_time: DateTime.current - n,
      end_time: DateTime.tomorrow - n,
      address: "R. Tia Ciata - Saúde, Rio de Janeiro - RJ",
      city: rio_de_janeiro[:city],
      state: rio_de_janeiro[:state]
    ).save(validate: false)
  end
end


# EVENTS IN SÃO PAULO
sao_paulo = { city: "São Paulo", state: "SP" }
collectives_in_sao_paulo =  Collective.order(created_at: :asc).offset(5).first(5)

collectives_in_sao_paulo.each do |collective|
 5.times do
    n = rand(1..10)
    Event.create!(
      collective: collective,
      name: Faker::Book.title,
      description: Faker::Lorem.paragraphs,
      start_time: DateTime.current + n,
      end_time: DateTime.tomorrow + n,
      address: "Av. Mário de Andrade, 141 - Barra Funda, São Paulo - SP",
      city: sao_paulo[:city],
      state: sao_paulo[:state]
    )
  end

  # Create previous events
  3.times do
    n = rand(1..10)
    Event.new(
      collective: collective,
      name: Faker::Book.title,
      description: Faker::Lorem.paragraphs,
      start_time: DateTime.current - n,
      end_time: DateTime.tomorrow - n,
      address: "R. Tia Ciata - Saúde, Rio de Janeiro - RJ",
      city: sao_paulo[:city],
      state: sao_paulo[:state]
    ).save(validate: false)
  end
end

# EVENTS IN BH
belo_horizonte = { city: "Belo Horizonte", state: "MG" }
collectives_in_bh = Collective.order(created_at: :asc).offset(10).first(3)

collectives_in_bh.each do |collective|
  3.times do
    n = rand(1..10)
    Event.create!(
      collective: collective,
      name: Faker::Book.title,
      description: Faker::Lorem.paragraphs,
      start_time: DateTime.current + n,
      end_time: DateTime.tomorrow + n,
      address: "Av. Antônio Abrahão Caram, 1001 - São José, Belo Horizonte - MG",
      city: belo_horizonte[:city],
      state: belo_horizonte[:state]
    )
  end
end

# EVENTS IN JF
juiz_de_fora = { city: "Juiz de Fora", state: "MG" }
collectives_in_jf = Collective.order(created_at: :asc).offset(15).first(2)
collectives_in_jf.each do |collective|
  3.times do
    n = rand(1..10)
    Event.create!(
      collective: collective,
      name: Faker::Book.title,
      description: Faker::Lorem.paragraphs,
      start_time: DateTime.current + n,
      end_time: DateTime.tomorrow + n,
      address: "Estrada Engenheiro Gentil Forn, 1000 - Juiz de Fora - MG",
      city: juiz_de_fora[:city],
      state: juiz_de_fora[:state]
    )
  end
end

# TO BE ADDED - NO MOMENTO 5 COLETIVOS ESTÃO SEM EVENTOS


# COLLECTIVES with no incoming events and 3 previous events
# collectives_with_previous_only = Collective.order(created_at: :asc).offset(15).last(5)

# 3.times do
#   Event.create!(
#     collective: collectives_with_previous_only[0],
#     name: Faker::Music.band,
#     description: Faker::Lorem.paragraphs,
#     start_time: DateTime.current - (i + 1),
#     end_time: DateTime.yesterday - (i + 1),
#     address: "#{Faker::Address.city}, #{Faker::Address.state}",
#     city: Faker::Address.city,
#     state: Faker::Address.state
#   )RAI
# end

# 4.times do
#   Event.create!(
#     collective: collectives_with_previous_only[1],
#     name: Faker::Music.band,
#     description: Faker::Lorem.sentence,
#     start_time: DateTime.current - (i + 1),
#     end_time: DateTime.yesterday - (i + 1),
#     address: "#{Faker::Address.city}, #{Faker::Address.state}",
#     city: Faker::Address.city,
#     state: Faker::Address.state
#   )
# end

# 7.times do
#   Event.create!(
#     collective: collectives_with_previous_only[2],
#     name: Faker::Music.band,
#     description: Faker::Lorem.sentence,
#     start_time: DateTime.current - (i + 1),
#     end_time: DateTime.yesterday - (i + 1),
#     address: "#{Faker::Address.city}, #{Faker::Address.state}",
#     city: Faker::Address.city,
#     state: Faker::Address.state
#   )
# end

# 11.times do
#   Event.create!(
#     collective: collectives_with_previous_only[3],
#     name: Faker::Music.band,
#     description: Faker::Lorem.sentence,
#     start_time: DateTime.current - (i + 1),
#     end_time: DateTime.yesterday - (i + 1),
#     address: "#{Faker::Address.city}, #{Faker::Address.state}",
#     city: Faker::Address.city,
#     state: Faker::Address.state
#   )
# end

# Event.create!(
#   collective: collectives_with_previous_only[4],
#   name: Faker::Music.band,
#   description: Faker::Lorem.sentence,
#   start_time: DateTime.current - (i + 1),
#   end_time: DateTime.yesterday - (i + 1),
#   address: "#{Faker::Address.city}, #{Faker::Address.state}",
#   city: Faker::Address.city,
#   state: Faker::Address.state
# )

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
