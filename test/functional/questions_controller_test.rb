require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  def setup
    @user_session = UserSession.create
    session[:user_session_id] = @user_session
    
    (0..4).each do |i|
      current_question = Question.new(:text => "Some text")      
      current_question.save
    end
    
    @answer = Answer.new(:text => "Right")
    @question = Question.first
    @question.answers << @answer
    @question.answers.build(:text => "Left")
    @question.answers.build(:text => "Both")
    @question.save
    
    @question.answers.first.increment!(:vote_count)
    @question.answers.first.increment!(:vote_count)
  end
  
  
  test "random should redirect to root with message if clicked random and answered all questions" do
    Question.all.each do |question|
      @user_session.vote!(question.id)
    end
    
    get :random
    assert_redirected_to root_path
  end
  
  test "vote_for should redirect you to question" do
    get :vote_for, :answer_id => @answer.id, :id => @question.id
    assert_redirected_to question_path(@question.id)
  end
  
  def teardown
    @user_session.delete
    Question.destroy_all
    Question.connection.execute('ALTER TABLE questions AUTO_INCREMENT = 1')
  end
  
end