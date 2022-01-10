# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Message.create!(title: "Lorem Ipsum Dolor",
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis tristique sollicitudin nibh sit. Velit dignissim sodales ut eu sem integer vitae. Semper quis lectus nulla at. Gravida in fermentum et sollicitudin ac orci phasellus egestas tellus. Sit amet risus nullam eget felis eget. Elit duis tristique sollicitudin nibh sit amet. Donec pretium vulputate sapien nec sagittis. Eu turpis egestas pretium aenean pharetra magna ac placerat. Sed vulputate mi sit amet. Cras ornare arcu dui vivamus arcu felis bibendum. Non quam lacus suspendisse faucibus interdum posuere. Euismod lacinia at quis risus sed vulputate odio. Nisi porta lorem mollis aliquam ut porttitor leo. Curabitur gravida arcu ac tortor dignissim convallis aenean. Neque egestas congue quisque egestas diam in arcu. Parturient montes nascetur ridiculus mus mauris vitae. Vel turpis nunc eget lorem dolor sed viverra ipsum nunc. Nibh sit amet commodo nulla facilisi nullam vehicula.")

Message.create!(title: "Lorem Ipsum, but in English",
                content: "The pain itself is the love of the pain, the main ecological problems, but I give this kind of time to fall down, so that some great pain and pain. This survey is chosen, and therefore the players improve it. The bed is not an integral element of the fauces. Nor do any rodeo diseases have the most exciting course of laughter. Nothing takes a guy to drink, it's just a whole lot. The element of easy timing or sorting. But the mass of life is ugly. Always be monitored for the freedom of the bills. You will be born a ridiculous muse to start a life of compensation to the lion. Adipiscing enim eu turpis egestas pretium aenean quiver. The pain and the immune system, but the bed is a lot of bears to choose. Consected lorem until the mass is wise in the throat and the annoyance and the immune system. He was willing to do what was said in the chocolate, not the main one. Tortor sauce for the fringe who or the eros till and hate. To bed with the bow to drink at the casino.")
                
m1 = Message.first
m2 = Message.last

m1.tags.create!(name: "Lorem")
m2.tags.create!(name: "Ipsum")