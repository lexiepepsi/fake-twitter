class Tweet < ActiveRecord::Base
	belongs_to(:user)
	validates(:title,
				presence: true)

	validates(:body, #name of the column (below = diff columns to validate)
				presence: true,
				length: {maximum: 30})

	# validates_presence_of(:title, :body)
	# validates_presence_of(:title, message: 'must be entered')
	# validates_presence_of(:body, message: 'must be entered')
end
