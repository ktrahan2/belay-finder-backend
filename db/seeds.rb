# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Partnership.destroy_all
User.destroy_all 

kyle = User.create(username: "ktrain", email: "ktrahan2@gmail.com", password: "1234567", name: "kyle trahan", aboutme: "I love to climb derp derps", climbing_skill: '5.9')
nate = User.create(username: "npalmore", email: "thisisnoteral@gmail.com", password: "1234567", name: "nate palmore", aboutme: "I climb so gud", climbing_skill: '5.10')

Partnership.create(requestor_id: kyle.id, receiver_id: nate.id, partnership_status: 'pending')

require 'rest-client'


# API key 200395731-ad9468d545d7bb427bc9280206f2c004
rm = RestClient.get 'https://www.mountainproject.com/data/get-routes-for-lat-lon?lat=40.0150&lon=-105.2705&maxDistance=200&minDiff=500&key=200395731-ad9468d545d7bb427bc9280206f2c004'

rm_array = JSON.parse(rm)

rm_array["routes"].map do |route|
    ClimbingRoute.create(
        name: route["name"],
        style: route["type"],
        difficulty: route["rating"],
        pitches: route["pitches"].to_s,
        location: route["location"][1],
        url: route["imgSmallMed"]
    )   
end