# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Beer.destroy_all

Beer.create({
    api_id: "1h3482",
    name: "Fat Tire",
    variety: "Amber",
    rating: 5,
    comments: "Awesome beer!"
})

Beer.create({
    api_id: "4h293z",
    name: "90 Schilling",
    variety: "Lager",
    rating: 4,
    comments: "Great drinking beer."
})