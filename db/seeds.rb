ritz_carlton = Hotel.create(name: 'The Ritz-Carlton New York, Central Park')
mandarin_oriental = Hotel.create(name: 'Mandarin Oriental, New York')
['City View Guestroom', 'Deluxe Parkview Room'].each do |rc|
  ritz_carlton.room_categories.create(name: rc)
end
['City View Room', 'Skyline View Room', 'Hudson River View Room'].each do |rc|
  mandarin_oriental.room_categories.create(name: rc)
end