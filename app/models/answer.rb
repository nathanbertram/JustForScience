class Answer < ActiveRecord::Base
  belongs_to :question
  validates_presence_of :text
  
  
  def upvote!
    
  end
  
  def downvote!
    
  end
  
end