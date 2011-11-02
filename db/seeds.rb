
question = Question.new(:text => "What's the better horned creature?", :preview_image => "betterhornedcreature.png")
question.answers << Answer.new(:text => 'Narwhals', :vote_count => 1)
question.answers << Answer.new(:text => 'Unicorns', :vote_count => 1)
question.answers << Answer.new(:text => 'Rhinoceros', :vote_count => 1)
question.save

question = Question.new(:text => "What food is best suited for strawberries as a topping?", :preview_image => "foodbestsuitedstrawberries.png")
question.answers << Answer.new(:text => 'Pancakes', :vote_count => 1)
question.answers << Answer.new(:text => 'Carrots', :vote_count => 1)
question.answers << Answer.new(:text => 'Waffles', :vote_count => 1)
question.answers << Answer.new(:text => 'Ice Cream', :vote_count => 1)
question.save

question = Question.new(:text => "Which time period and place would you most want to be king or emperor in?", :preview_image => "timetobeking.png")
question.answers << Answer.new(:text => 'Ancient Egypt', :vote_count => 1)
question.answers << Answer.new(:text => 'Medieval Britain', :vote_count => 1)
question.answers << Answer.new(:text => 'Pre-Columbus Mesoamerica', :vote_count => 1)
question.answers << Answer.new(:text => 'Feudal Japan', :vote_count => 1)
question.save


question = Question.new(:text => "How do you part your hair?", :preview_image => "parthairhow.png")
question.answers << Answer.new(:text => 'Middle', :vote_count => 1)
question.answers << Answer.new(:text => 'Left', :vote_count => 1)
question.answers << Answer.new(:text => 'Right', :vote_count => 1)
question.answers << Answer.new(:text => 'No Part', :vote_count => 1)
question.save

question = Question.new(:text => 'Which shift button do you use?', :preview_image => "whichshiftpreview.png")
question.answers << Answer.new(:text => 'Right Shift', :vote_count => 314)
question.answers << Answer.new(:text => 'I use both', :vote_count => 1330)
question.answers << Answer.new(:text => 'Left Shift', :vote_count => 2967)
question.save