require 'test_helper'

class QuestionTest < ActiveSupport::TestCase  
  def setup    
    (0..4).each do |i|
      current_question = Question.new(:text => "Some text")      
      current_question.save
    end
    
    @question = Question.first
    @question.answers.build(:text => "Right")
    @question.answers.build(:text => "Left")
    @question.answers.build(:text => "Both")
    @question.save
    
    @question.answers.first.increment!(:vote_count)
    @question.answers.first.increment!(:vote_count)
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
  
  test "build_chart_js should return a javascript string for google gantt chart based on question's answers statistics" do
    assert_equal build_chart_js_expected, @question.build_chart_js, "question.build_chart_js did not build a proper gantt chart"
  end
  
  def teardown
    Question.destroy_all
    Question.connection.execute('ALTER TABLE questions AUTO_INCREMENT = 1')
  end
  
  private
  
  # moved here just to keep test clean
  def build_chart_js_expected
    output = "data.addColumn('string', 'Task');\n"
    output += "data.addColumn('number', 'Some text');\n"
    output += "data.addRows(3);\n"
    output += "data.setValue(0, 0, 'Right');\n"
    output += "data.setValue(0, 1, 2);\n"
    output += "data.setValue(1, 0, 'Left');\n"
    output += "data.setValue(1, 1, 0);\n"
    output += "data.setValue(2, 0, 'Both');\n"
    output += "data.setValue(2, 1, 0);\n"
    
    output
  end
  
end