class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :place

	RATINGS = {
		'* - Extremely Poor' => '1_star', 
		'* * - Below Average' => '2_stars', 
		'* * * - Average' => '3_stars', 
		'* * * * - Above Average ' => '4_stars', 
		'* * * * * - Excellent!' => '5_stars', 
		}

		def humanized_rating 
			RATINGS.invert[self.rating]
		end
end
