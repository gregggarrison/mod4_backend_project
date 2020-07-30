# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Meal.destroy_all
User.destroy_all

u1 = User.create(
    username: "gregg",
    password: "gregg",
    age: 35,
    sex: "male",
    height: 74,
    weight: 235,
)

u1.meals.create(
    serveQty: 1,
    foodName: "taco",
    serveUnit: "taco",
    calories: 111,
    allFat: 3,
    protein: 45,
    carbohydrates: 22,
    cholesterol: 34,
    user: u1
)

#  t.integer :serveQty
#  t.string :foodName
#  t.string :serveUnit
#  t.decimal :calories
#  t.decimal :allFat
#  t.decimal :protein
#  t.decimal :carbohydrates
#  t.decimal :cholesterol
#  t.references :user, null: false, foreign_key: true