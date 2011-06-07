class QuestionsController < ApplicationController
  before_filter :find_or_create_user_session
  
  def index
    @question = Question.last
  end
  
  def show
    if params[:random]
      @question = Question.random_not_in @user_session.question_ids
    else
      @question = Question.find(params[:id], :include => [:answers])
    end
  end
  
  def vote_for
    @answer = Answer.find(params[:answer_id], :conditions => {:question_id => params[:id]})
    @answer.increment!(:vote_count)
    @user_session.vote!(params[:id])
    redirect_to question_path(params[:question_id])
  end
  
  private
  
  def find_or_create_user_session
    @user_session = UserSession.find_or_create_by_id(session[:user_session_id])
    session[:user_session_id] = @user_session
  end
  
  
end