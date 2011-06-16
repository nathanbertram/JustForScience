require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup    
    (0..4).each do |i|
      current_question = Question.new(:text => "Some text")
      current_question.save
    end
  end
  
  test "random should return a question" do
    random_question = Question.random
    assert Question == random_question.class, "random did not return an instance of question"
  end
  
  test "random_not_in should not return a question with an id in the array" do
    @not_in_ids = [1, 3, 4, 5]
    random_question = Question.random_not_in @not_in_ids
    assert_equal 2, random_question.id, "random_not_in returned bad question. Expected 2, got #{random_question.id}"
  end
  
  test "random_not_in should return nil if all questions have been voted on" do
    @not_in_ids = [1, 2, 3, 4, 5]
    random_question = Question.random_not_in @not_in_ids
    assert_equal nil, random_question, "random_not_in did not return nil when all questions were answered"
  end
  
  def teardown
    Question.destroy_all
    Question.connection.execute('ALTER TABLE questions AUTO_INCREMENT = 1')
  end
end