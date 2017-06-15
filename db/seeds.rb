# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

user1 = User.create!(user_name: "Poll Maker")
user2 = User.create!(user_name: "Poll Responder")

movie_poll = Poll.create!(author_id: user1.id, title: "Movie Poll")

q_1_1 = Question.create!(poll_id: movie_poll.id, text: "Which Marvel movie was best?")
q_1_2 = Question.create!(poll_id: movie_poll.id, text: "Which DC movie was best?")
q_1_3 = Question.create!(poll_id: movie_poll.id, text: "Which Star Wars movie was best?")

AnswerChoice.create!(question_id: q_1_1.id, text: "Civil War")
a1 = AnswerChoice.create!(question_id: q_1_1.id, text: "Captain America")
AnswerChoice.create!(question_id: q_1_1.id, text: "Spiderman")

AnswerChoice.create!(question_id: q_1_2.id, text: "Batman Begins")
a2 = AnswerChoice.create!(question_id: q_1_2.id, text: "Superman Returns")
AnswerChoice.create!(question_id: q_1_2.id, text: "Wonder Woman")

AnswerChoice.create!(question_id: q_1_3.id, text: "A New Hope")
a3 = AnswerChoice.create!(question_id: q_1_3.id, text: "Empire Strikes Back")
AnswerChoice.create!(question_id: q_1_3.id, text: "Return of the Jedi")

Response.create!(user_id: user2.id, answer_choice_id: a1.id)
Response.create!(user_id: user2.id, answer_choice_id: a2.id)
Response.create!(user_id: user2.id, answer_choice_id: a3.id)
