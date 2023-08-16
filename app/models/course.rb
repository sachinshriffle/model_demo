class Course < ApplicationRecord
	belongs_to :college
	# validates :course_name, uniqueness:{scope: :college_name, message: "course name can't same in a same college"}
end
