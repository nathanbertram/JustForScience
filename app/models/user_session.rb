class UserSession < ActiveRecord::Base
  before_create :initialize_question_ids
  
  def initialize_question_ids
      self.question_ids = []
  end

  def question_ids=(opts)
    write_attribute(:question_ids, opts.to_yaml)
  end

  def question_ids
    if c = read_attribute(:question_ids)
      YAML::load(c)
    end
  end
  
  def voted_for?(question_id)
    question_ids.include?(question_id.to_i)
  end
  
  def vote!(question_id)
    unless voted_for?(question_id)
      self.question_ids = question_ids << question_id.to_i
    end
    save
  end

end