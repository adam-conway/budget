# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Budget.destroy_all
Charge.destroy_all
Category.destroy_all
Adjustment.destroy_all
ChargeCategoryAdjustment.destroy_all
User.destroy_all

BUDGETS = ["Denver", "SF", "Adam", "Random", "Thing", "Help"]
# CHARGES = (-100.00..100.00)
PAYEE = ["Adam", "Mariah", "Evan", "Target", "Walmart"]
DATE = ['2018-04-01', '2018-04-02', '2018-04-03']
NOTES = ["This was a great purchase", "This was a bad purchase", "This was an ok purchase"]
CATEGORIES = ["Rent", "Food", "Car Payment", "Car Insurance", "Phone"]
USERS = ["Adam", "John", "Jeff", "Kelly", "Martha"]

User.create!(username: "username", password: "password", role: 1)

USERS.each do |user|
  User.create!(username: user, password: 'password')
end

BUDGETS.each do |budget|
  User.all.sample.budgets.create!(name: budget)
end

budget = Budget.all.sample

CATEGORIES.each do |category|
  budget.categories.create!(title: category)
end

50.times do |num|
  charge = budget.charges.create!(date: DATE.sample, payee: PAYEE.sample, notes: NOTES.sample, amount: rand(-100.00..100.00))
  2.times do
    adjustment = Adjustment.create!(amount: (charge.amount)/2)
    ChargeCategoryAdjustment.create!(category_id: Category.all.sample.id, charge_id: charge.id, adjustment_id: adjustment.id)
  end
  puts "Charge #{num} created"
end
