# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

question = Question.new(:text => 'which shift button do you use?')
question.answers = [Answer.new(:text => 'left shift'), Answer.new(:text => 'both'), Answer.new(:text => 'Right shift')]
question.save