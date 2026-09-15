# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = EscapeGame.create([{ title: 'Star Wars' }, { title: 'Lord of the Rings' }])
#   ...
#   Character.create(name: 'Luke', movie: movies.first)

EscapeGame.create!([
  {
    title: 'Bissy',
    description:
    %{
      A very interesting escape game in Mas Barral.
    }.squish,
    difficulty: 2,
    image_file_name: "placeholder.png"
  },
  {
    title: 'Cognin',
    description:
    %{
      A quite interesting escape game in la Ferme de Forezan.
    }.squish,
    difficulty: 3,
    image_file_name: "placeholder.png"
  },
  {
    title: 'La Motte Servolex',
    description:
    %{
      A very good escape game in La Motte Servolex.
    }.squish,
    difficulty: 4,
    image_file_name: "placeholder.png"
  }
])

Question.create! ([
  {
    question: "Were you there?",
    answer: "Yes",
    escape_game_id: 1
  },
  {
    question: "Were you really there?",
    answer: "No",
    escape_game_id: 2
  }
])

User.create! ([
  {
    id: 1,
    name: "Admin",
    email: "admin@example.com",
    password: "adminadmin",
    username: "adminguy",
    admin: true
  },
  {
    id: 2,
    name: "User",
    email: "user@example.com",
    password: "useruser12",
    username: "poweruser",
    admin: false
  }
])
