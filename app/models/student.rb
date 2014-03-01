class Student < ActiveRecord::Base
  has_many :assessments
  belongs_to:classroom
  belongs_to:section
end
