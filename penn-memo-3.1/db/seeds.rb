# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


c1 = Tag.create(name: "-choose a tag-")
c1 = Tag.create(name: "# 1st floor")
c2 = Tag.create(name: "# 2nd floor")
c3 = Tag.create(name: "# 3rd floor")
c4 = Tag.create(name: "Breast screening")
c5 = Tag.create(name: "Diagnostic imaging")
c6 = Tag.create(name: "Pharmacy")


Memo.create(title: "Buy medicine", author: "Li", date: "2016-11-14", content: "Buy some painkiller today.", tag:c6, priority: true)
Memo.create(title: "Thanksgiving!", author: "Chen", date: "2016-11-11", content: "Thanksgiving break tomorrow!", tag:c3, priority: false)
Memo.create(title: "Cleaning", author: "Zhou", date: "2016-11-12", content: "Clean first floor today", tag:c1, priority: false)