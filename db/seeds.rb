# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
    sayings = ["You almost messed that one up. Don't lose this second chance!", "Well, go get em' tiger! Go for a nice date sesh walk on the beach!", "Have fun, you two! And don't be so light on the signals this time!", "It's a re-match! Don't blow it this time."]

    sayings.each do |saying|
	    YesSaying.create(saying: saying)
    end

    friend_sayings = ["You know they say friendship lasts longer than romance.", "\"True friendship is when you walk into their house and your WiFi connects automatically.\" -the internets", "You two think each other are pretty damn cool. Go grab a drink and cheers to new friendship", "You just made a new friend! Go make some crazy memories and feel free to be yourself!"]

    friend_sayings.each do |saying|
	    FriendSaying.create(saying: saying)
    end

