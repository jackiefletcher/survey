class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:answers)
  has_and_belongs_to_many(:results)
end
