class Section < ActiveRecord::Base
    has_many:classrooms, :through => :students
    has_many:students

end
