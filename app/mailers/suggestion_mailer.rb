class SuggestionMailer < ActionMailer::Base
  default :from => 'CompetitorTab <do-not-reply@competitortab.com>'
  
  def notify(suggestion)
    @suggestion = suggestion
    mail(:to => ["nathan@competitortab.com", "andrew@competitortab.com"], :subject => "CompetitorTab - Contact Form")
  end

end