class UserDatingUsername < ActiveRecord::Base
	belongs_to :user

	validates :dating_site_website, :inclusion => {:in => ['OkCupid', 'Tinder', 'eHarmony', 'Match.com', 'PlentyofFish', 'Zoosk', 'Christian Mingle', 'DateHookup', 'HowAboutWe', 'Coffee Meets Bagel', 'BlackPeopleMeet', 'JDate', 'Badoo', 'Meetme', 'Skout', 'SeniorPeopleMeet']}, allow_blank: true

end
