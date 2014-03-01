class Classroom < ActiveRecord::Base
    has_many:sections, :through => :students
    has_many:students

end
