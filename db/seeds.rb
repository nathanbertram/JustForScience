# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

question = Question.new(:text => 'Which shift button do you use?', :preview_image => "whichshiftpreview.png")
question.answers << Answer.new(:text => 'Left Shift', :html_class => 'left_shift', :vote_count => 2967)
question.answers << Answer.new(:text => 'I use both', :html_class => 'middle_shift', :vote_count => 1330)
question.answers << Answer.new(:text => 'Right Shift', :html_class => 'middle_shift', :vote_count => 314)
question.save