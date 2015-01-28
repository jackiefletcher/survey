class Answers < ActiveRecord::Base
  belongs_to (:question)
end
