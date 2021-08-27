# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pine = Bookshelf.create!(name: 'Pine', full: false, capacity: 12)
oak = Bookshelf.create!(name: 'Oak', full: true, capacity: 2)
Book.create!(name: 'Feet of Clay', author: 'Terry Pratchet', read: true, read_time: 6, bookshelf_id: oak.id)
Book.create!(name: 'Three Guineas', author: 'Virginia Woolf', read: false, read_time: 12, bookshelf_id: oak.id)

bummer = CarLot.create!(name: "Michael'z Bummer Dealz", being_cleaned: false, lot_area: 16)
fly = CarLot.create!(name: "Fly Rides", being_cleaned: true, lot_area: 9001)
Vehicle.create!(name: 'Toyota Corolla', sold: true, price: 300, car_lot_id: fly.id)
Vehicle.create!(name: 'Honda Civic', sold: false, price: 801, car_lot_id: fly.id)
