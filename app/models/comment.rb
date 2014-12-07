class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
	after_create :send_comment_email

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

		 def send_comment_email
      		NotificationMailer.comment_added(self).deliver
  		end
end
