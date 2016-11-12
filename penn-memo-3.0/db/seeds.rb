# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Memo.destroy_all
Category.destroy_all

c1 = Category.create(:name => "1st Floor")
c2 = Category.create(:name => "2nd Floor")
c3 = Category.create(:name => "3rd Floor")

Memo.create(:title => "Something new", :author => "Li", :date => "2016-11-12", :content => "Thanksgiving is coming!")
