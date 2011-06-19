class Question < ActiveRecord::Base
  has_many :answers
  
  validates_presence_of :text
  
  def build_chart_js
    output = "data.addRows(#{answers.size});\n"
    answers.each_with_index do |answer, index|
      output += "data.setValue(#{index}, 0, '#{answer.text}');\n"
      output += "data.setValue(#{index}, 1, #{answer.votes || 1});\n"
    end
    
    output
  end
  
  def self.random_not_in(not_in_ids = [])
    if not_in_ids.empty?
      random
    elsif not_in_ids.count < Question.count
      question = random
      question = random while not_in_ids.include? question.id
      question
    else
      nil
    end
  end
  
  def self.random
    Question.offset(rand(Question.count)).first
  end
end