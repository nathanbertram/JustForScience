class Suggestion < ActiveRecord::Base
  validates_presence_of :email
  after_create :notify_the_troops
  
  def notify_the_troops
    SuggestionMailer.notify(self).deliver
  end
  
end
