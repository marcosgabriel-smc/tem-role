require 'open-uri'

# CLEAN DB
######################################################################
puts 'Cleaning the database...'
CollectiveGenre.destroy_all
EventGenre.destroy_all
Genre.destroy_all
EventListSubscription.destroy_all
EventList.destroy_all
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
      username: 'yurimzk',
      first_name: 'Yuri',
      last_name: 'Tagomori',
      password: 'asdfgçlkjh',
      email: 'yuri@temrole.org'
    },
    {
      username: 'pedrosouzadevs',
      first_name: 'Pedro',
      last_name: 'Souza',
      password: 'asdfgçlkjh',
      email: 'pedrosouza@temrole.org'
    },
    {
      username: 'Petkoffoli',
      first_name: 'Pedro',
      last_name: 'Zoffli',
      password: 'asdfgçlkjh',
      email: 'pzoff@temrole.org'
    },
    {
      username: 'leonardorba',
      first_name: 'Leanardo',
      last_name: 'Silva',
      password: 'asdfgçlkjh',
      email: 'leo@temrole.org'
    },
    {
      username: 'ANNEBORTOLI',
      first_name: 'Anne',
      last_name: 'Bortoli',
      password: 'asdfgçlkjh',
      email: 'anne@temrole.org'
    },
    {
      username: 'bfazz',
      first_name: 'Bruno',
      last_name: 'Fazz',
      password: 'asdfgçlkjh',
      email: 'bruno@temrole.org'
    },
    {
      username: 'atrajkovic',
      first_name: 'Areceli',
      last_name: 'Gallardo',
      password: 'asdfgçlkjh',
      email: 'ara@temrole.org'
    },
    {
      username: 'zeninguem',
      first_name: 'José',
      last_name: 'Nobody',
      password: 'asdfgçlkjh',
      email: 'zeninguem@temrole.org'
    },
    {
      username: 'ze',
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

collective_description = "O coletivo de música eletrônica é uma comunidade vibrante e apaixonada dedicada à exploração sonora e à criação de experiências únicas. Composto por artistas, produtores e entusiastas, esse coletivo busca promover a diversidade musical, unindo pessoas através das batidas pulsantes e das melodias cativantes do universo eletrônico.

Nesse ecossistema colaborativo, os membros compartilham conhecimentos, habilidades e inspirações, criando um ambiente propício para o crescimento artístico e a experimentação sonora. O coletivo promove eventos eletrizantes, onde DJs e produtores talentosos se revezam nos decks, criando uma atmosfera envolvente que faz o público mergulhar em uma jornada sonora única."

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

collective_names.each do |name|
  owner = User.all.sample
  Collective.create!(
    {
      name:,
      description: collective_description,
      city: 'any city',
      state: Event::STATES.sample,
      owner:
    }
  )
end

# collective logos (aka avatar)
######################################################################
puts 'Uploading collective images to cloudinary...'

banner1 = URI.open("https://images.pexels.com/photos/1540319/pexels-photo-1540319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
lewagang.banner.attach(io: banner1, filename: "banner.jpg", content_type: "image/png")
logo1 = URI.open("https://i.imgur.com/LL69Go8.png")
lewagang.logo.attach(io: logo1, filename: "logo1.png", content_type: "image/png")
lewagang.save

banner2 = URI.open("https://art.ngfiles.com/images/1088000/1088037_twosipsofbleach_new-banner-icon.png?f1574212770")
uzalemaun.banner.attach(io: banner2, filename: "banner2.png", content_type: "image/png")
logo2 = URI.open("https://art.ngfiles.com/comments/70000/iu_70834_7446245.jpg")
uzalemaun.logo.attach(io: logo2, filename: "logo2.png", content_type: "image/png")
uzalemaun.save

collective_avatars = [
  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/21/a6/d4/be/our-logo.jpg?w=1200&h=1200&s=1",
  "https://ticketsibiza.co.uk/wp-content/uploads/2019/04/Hi_Logo_Monochrome.png",
  "https://i1.sndcdn.com/artworks-000647750056-y32cgx-t500x500.jpg",
  "https://i1.sndcdn.com/artworks-b2A8u77oCyLYUwi3-yhbvxg-t500x500.jpg",
  "https://i1.sndcdn.com/artworks-wnP7WnDkHdCyziDF-yGV1cA-t500x500.jpg",
  "https://i1.sndcdn.com/artworks-4xmWObWwi9MqwiXR-zjxtkw-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-T76WITEA8wGJg6p4-tNSmQQ-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-y2Vs5f1rksRJxDDT-PU3j9Q-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-cRyOtwmX25PtZcKX-gvSXfg-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-3WlTiFFl5mI9yIZ6-mT9xPA-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-000661557005-yaofdc-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-000468800379-pptiei-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-kQjz29CzQUIgueyT-jkG4iQ-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-jwW4vOngHy1vTO1b-zjX3RA-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-UIqEWDLhLKLWekfL-ILGNKw-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-IU3pFXTDq7Dgm8V8-6ddSaQ-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-fGfy1tgSL8Pp5EDy-Gkyi6Q-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-KetjjxPUOsnpuHc0-qBZh1g-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-vFqpPNxNpxVdguNG-Gzgynw-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-000142400502-ozey8z-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-PsqqCyR1Zm60kmTL-HPOZoA-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-DkzvbcNgNRINdX4v-dEmq4A-t500x500.jpg",
  "https://i1.sndcdn.com/avatars-000571376391-w6gdii-t500x500.jpg"
]

Collective.all.each do |collective|
  i = collective.id % collective_avatars.length
  url = collective_avatars[i]
  logo = URI.open(url)
  collective.logo.attach(io: logo, filename: "logo.jpg", content_type: "image/png")
  collective.save
  puts "-> #{collective.name} - done!"
end

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

event_description = "
Estamos prontos para uma nova missão, onde você será o jogador e os DJs assumem o controle da pista para levá-lo até as últimas fases da noite.

No dia 16 de junho os alunos do Le Wagon Rio de Janeiro terminam seu batch e estão prontos pra comemorar.

Nesse finalíssimo happy-hour, teremos no comando dos decks:

- Dede Menezes
- Ariel
- Marcos
- Viktor

Então deixa agendado: 16 de junho é o dia de fecharmos essa experiência e explorar esse universo de instintos e inspirações. Prepare seus controles.

Até breve. Aperta o play e dê o start.
"

def subscribe_all_users_to_last_event_list
  User.all.each do |user|
    event_list = EventList.last
    EventListSubscription.create!(event_list:, user:)
  end
end


## EVENTS IN RIO
rio_de_janeiro = { city: "Rio de Janeiro", state: "RJ" }
collectives_in_rio = Collective.order(created_at: :asc).first(5)

collectives_in_rio.each do |collective|
  # Create incoming events
  5.times do
    n = rand(1..10)
    event = Event.new(
      collective:,
      name: Faker::Book.title,
      description: event_description,
      start_time: DateTime.current + n,
      end_time: DateTime.tomorrow + n,
      address: "R. Cordeiro da Graça - Santo Cristo - Rio de Janeiro - RJ",
      city: rio_de_janeiro[:city],
      state: rio_de_janeiro[:state]
    )
    event.save!
    subscribe_all_users_to_last_event_list
  end
  # Create previous events
  3.times do
    n = rand(1..10)
    event = Event.create(
      collective:,
      name: Faker::Book.title,
      description: event_description,
      start_time: DateTime.current - n,
      end_time: DateTime.tomorrow - n,
      address: "R. Tia Ciata - Saúde, Rio de Janeiro - RJ",
      city: rio_de_janeiro[:city],
      state: rio_de_janeiro[:state]
    )
    event.save(validate: false)
    subscribe_all_users_to_last_event_list
  end
end

# EVENTS IN SÃO PAULO
sao_paulo = { city: "São Paulo", state: "SP" }
collectives_in_sao_paulo = Collective.order(created_at: :asc).offset(5).first(5)

collectives_in_sao_paulo.each do |collective|
  5.times do
    n = rand(1..10)
    event = Event.create(
      collective:,
      name: Faker::Book.title,
      description: event_description,
      start_time: DateTime.current + n,
      end_time: DateTime.tomorrow + n,
      address: "Av. Mário de Andrade, 141 - Barra Funda, São Paulo - SP",
      city: sao_paulo[:city],
      state: sao_paulo[:state]
    )
    event.save!
    subscribe_all_users_to_last_event_list
  end

  # Create previous events
  3.times do
    n = rand(1..10)
    event = Event.create(
      collective:,
      name: Faker::Book.title,
      description: event_description,
      start_time: DateTime.current - n,
      end_time: DateTime.tomorrow - n,
      address: "R. Tia Ciata - Saúde, Rio de Janeiro - RJ",
      city: sao_paulo[:city],
      state: sao_paulo[:state]
    )
    event.save(validate: false)
    subscribe_all_users_to_last_event_list
  end
end

# EVENTS IN BH
belo_horizonte = { city: "Belo Horizonte", state: "MG" }
collectives_in_bh = Collective.order(created_at: :asc).offset(10).first(3)

collectives_in_bh.each do |collective|
  3.times do
    n = rand(1..10)
    event = Event.create(
      collective:,
      name: Faker::Book.title,
      description: event_description,
      start_time: DateTime.current + n,
      end_time: DateTime.tomorrow + n,
      address: "Av. Antônio Abrahão Caram, 1001 - São José, Belo Horizonte - MG",
      city: belo_horizonte[:city],
      state: belo_horizonte[:state]
    )
    event.save!
    subscribe_all_users_to_last_event_list
  end
end

# EVENTS IN JF
juiz_de_fora = { city: "Juiz de Fora", state: "MG" }
collectives_in_jf = Collective.order(created_at: :asc).offset(15).first(2)
collectives_in_jf.each do |collective|
  3.times do
    n = rand(1..10)
    event = Event.create(
      collective:,
      name: Faker::Book.title,
      description: event_description,
      start_time: DateTime.current + n,
      end_time: DateTime.tomorrow + n,
      address: "Estrada Engenheiro Gentil Forn, 1000 - Juiz de Fora - MG",
      city: juiz_de_fora[:city],
      state: juiz_de_fora[:state]
    )
    event.save!
    subscribe_all_users_to_last_event_list
  end
end

# TO BE ADDED - NO MOMENTO 5 COLETIVOS ESTÃO SEM EVENTOS

# COLLECTIVES with no incoming events and 3 previous events
# collectives_with_previous_only = Collective.order(created_at: :asc).offset(15).last(5)

# 3.times do
#   Event.create(
#     collective: collectives_with_previous_only[0],
#     name: Faker::Music.band,
#     description: event_description,
#     start_time: DateTime.current - (i + 1),
#     end_time: DateTime.yesterday - (i + 1),
#     address: "#{Faker::Address.city}, #{Faker::Address.state}",
#     city: Faker::Address.city,
#     state: Faker::Address.state
#   )RAI
# end

# 4.times do
#   Event.create(
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
#   Event.create(
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
#   Event.create(
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

# Event.create(
#   collective: collectives_with_previous_only[4],
#   name: Faker::Music.band,
#   description: Faker::Lorem.sentence,
#   start_time: DateTime.current - (i + 1),
#   end_time: DateTime.yesterday - (i + 1),
#   address: "#{Faker::Address.city}, #{Faker::Address.state}",
#   city: Faker::Address.city,
#   state: Faker::Address.state
# )

# ADDING FLYERS TO ALL EVENTS
######################################################################

event_images = [
  "https://media.redbullmusicacademy.com/assets/1.ac7fd238.jpg?auto=format&w=700",
  "https://www.electronicbeats.net/app/uploads/2016/12/moby-610x710.jpeg",
  "https://www.electronicbeats.net/app/uploads/2016/02/raveflyer-e1455641396469.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/c571fa7762add7ac2b87c26f9b6b06c7a8b012ac.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/c571fa7762add7ac2b87c26f9b6b06c7a8b012ac.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/56f8e143-6910-41db-8bed-765b1e4e373c.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/56f8e143-6910-41db-8bed-765b1e4e373c.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/35ade87ff83fc46d31396189608ff2396ac72317.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/ad9d8d27-78a5-4f18-b8b1-34f2c4d6e28d.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/a1f166ff-b1cc-495f-a051-373120597f29.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/f4d0ba68-4323-4398-807a-b82e9ca2ab37.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/dee47b97-454f-49d0-850f-adb62bc29829.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/90de8e317f946bd0d793c603826cc64633c3c877.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/ab3399e4-0a3b-4a93-93d2-211ad59359a3.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/ad9d8d27-78a5-4f18-b8b1-34f2c4d6e28d.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/d3fffad2-b551-4cd7-b7d1-7b475484f32b.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/17cb3e13-42c5-4dc9-9d32-1b470a720c23.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/835733d7-fb7d-4f53-96bd-0550411321e8.jpg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/b7739f82-a66b-41af-9afd-51b14c867ee5.jpeg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/8cb365ef-5efc-4e71-b508-a16e11d0301b.jpeg",
  "https://assets.phatmedia.co.uk/public/flyers/preview/a2945331-adb9-4f2e-8781-6d8223e355d5.jpeg"
]

Event.all.each do |event|
  i = event.id % event_images.length
  url = event_images[i]
  logo = URI.open(url)
  event.logo.attach(io: logo, filename: "logo.jpg", content_type: "image/png")
  event.save
  puts "-> #{event.name} - done!"
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
