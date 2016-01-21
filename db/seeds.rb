# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  User.create({user_name: Faker::Name.name})
end

User.all.each do |user|
  5.times do
    Poll.create(author_id: user.id, title: Faker::Lorem.word)
  end
end

Poll.all.each do |poll|
  5.times do
    Question.create(poll_id: poll.id, text: Faker::Lorem.sentence)
  end
end

Question.all.each do |question|
  5.times do
    AnswerChoice.create(question_id: question.id, text: Faker::Lorem.sentence)
  end
end

users = User.all
ans_choice = AnswerChoice.all
5.times do |index|
  Response.create(user_id: users[index].id, answer_choice_id: ans_choice.sample.id)
  Response.create(user_id: users[index].id, answer_choice_id: ans_choice.sample.id)
  Response.create(user_id: users[index].id, answer_choice_id: ans_choice.sample.id)
  Response.create(user_id: users[index].id, answer_choice_id: ans_choice.sample.id)
  Response.create(user_id: users[index].id, answer_choice_id: ans_choice.sample.id)
  Response.create(user_id: users[index].id, answer_choice_id: ans_choice.sample.id)
  Response.create(user_id: users[index].id, answer_choice_id: ans_choice.sample.id)
  Response.create(user_id: users[index].id, answer_choice_id: ans_choice.sample.id)
end
