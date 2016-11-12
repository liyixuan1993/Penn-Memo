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
c4 = Category.create(:name => "Accident and emergency (A&E)")
c5 = Category.create(:name => "Diagnostic imaging")
c6 = Category.create(:name => "Pharmacy")

Memo.create(:title => "Something new", :author => "Li", :date => "2016-11-12", :category => c2, :content => "Thanksgiving is coming!", :priority=>"1")
Memo.create(:title => "Something else", :author => "Chen", :date => "2016-11-13", :category => c1, :content => "Change medicine for patient 2.", :priority=>3)
Memo.create(:title => "Buy medicine", :author => "Zhou", :date => "2016-11-13", :category => c6, :content => "Buy some painkiller!", :priority=>2)
