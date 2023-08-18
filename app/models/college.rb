class College < ApplicationRecord
	has_many :courses , dependent: :destroy
	has_one :address , dependent: :destroy

	validates :college_name , presence: true , uniqueness: { scope: :city, message: "College Name Can't Same Within City"}
	validates :city , presence: true
	after_save :commit_message
	before_validation :remove_whitespace

	def self.search(city)
		result=Course.joins(:college).where("city=?",city)
		result.each do |res|
			puts res.course_name
		end
	end

	private 
	def commit_message
		puts "Information Saved Successfully!"
	end

	def remove_whitespace
		self.city = self.city.downcase.strip
		self.college_name = self.college_name.strip.downcase
	end
end
