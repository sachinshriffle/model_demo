class Address < ApplicationRecord
	belongs_to :college
	validates  :college_id ,uniqueness:{ message:"address already exist"}
end
