class Launch < ActiveRecord::Base
  validates_presence_of :email
end