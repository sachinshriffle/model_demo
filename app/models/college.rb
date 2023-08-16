class College < ApplicationRecord
	has_many :courses
	has_one :address

	validates :college_name , presence: true , uniqueness: { scope: :city, message: "College Name Can't Same Within City"}
	validates :city , presence: true
	after_save :commit_message
	before_validation :remove_whitespace

	private 
	def commit_message
		puts "Information Saved Successfully!"
	end

	def remove_whitespace
		self.city = self.city.downcase.strip!
		self.college_name = self.college_name.strip.downcase
	end
end
