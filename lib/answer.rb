class Answer < ActiveRecord::Base
  belongs_to (:question)
  has_and_belongs_to_many(:responses)
end
