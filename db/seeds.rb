# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Practice.create(id: 1, title: "first title", description: "first description", contents: "hello first")
Practice.create(id: 2, title: "second title", description: "second description", contents: "hello second")
Practice.create(id: 3, title: "third title", description: "third description", contents: "hello third")

CommandType.create(id:1, name: "")
CommandType.create(id:2, name: "")
CommandType.create(id:3, name: "")
CommandType.create(id:4, name: "")

Genre.create(id:1, name: "linux")
Genre.create(id:2, name: "vim")
Genre.create(id:3, name: "python")
Genre.create(id:4, name: "go")
Genre.create(id:5, name: "powershell")
Genre.create(id:6, name: "cmd")
Genre.create(id:7, name: "ruby")
Genre.create(id:8, name: "git")
