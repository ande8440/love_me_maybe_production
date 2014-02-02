class UserDatingUsername < ActiveRecord::Base
	belongs_to :user
	before_validation :set_uniq_username

	validates :dating_site_website, :inclusion => {:in => ['OkCupid', 'Tinder', 'eHarmony', 'Match.com', 'PlentyofFish', 'Zoosk', 'Christian Mingle', 'DateHookup', 'HowAboutWe', 'Coffee Meets Bagel', 'BlackPeopleMeet', 'JDate', 'Badoo', 'Meetme', 'Skout', 'SeniorPeopleMeet']}, allow_blank: true
	validates_uniqueness_of :uniq_username, allow_nil: true, allow_blank: true, message: "- We're sorry, but a profile with that dating site username already exists."
	validate :check_username_site_presence

	def check_username_site_presence
		if ! self.dating_site_username.blank? || ! self.dating_site_website.blank?
			if self.dating_site_username.blank? || self.dating_site_website.blank?
				errors.add(:dating_site_username, "must provide both username and site")
			end
		end
	end

	def set_uniq_username
		if ! self.dating_site_username.blank? && ! self.dating_site_website.blank?
			self.uniq_username = "#{self.dating_site_username}-#{self.dating_site_website}"
		end
	end
end
