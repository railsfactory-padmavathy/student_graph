class Assessment < ActiveRecord::Base
belongs_to:student
validates :FA1,:FA2,:SA1, presence: true
end
