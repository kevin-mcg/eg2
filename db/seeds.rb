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
    %(
      A very interesting escape game in Mas Barral.
    ).squish,
    difficulty: 2
  },
  {
    title: 'Cognin',
    description:
    %(
      A quite interesting escape game in la Ferme de Forezan.
    ).squish,
    difficulty: 3
  },
  {
    title: 'La Motte Servolex',
    description:
    %(
      A very good escape game in La Motte Servolex.
    ).squish,
    difficulty: 4
  }
])

Question.create! ([
  {
    question: "What?",
    answer: "Yes",
    escape_game_id: 1
  },
  {
    question: "Where?",
    answer: "No",
    escape_game_id: 2
  }
])
