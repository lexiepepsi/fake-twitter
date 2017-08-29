class Tweet < ActiveRecord::Base
	belongs_to(:user)
	validates(:title,
				presence: true)

	validates(:body, #name of the column (below = diff columns to validate)
				presence: true,
				length: {maximum: 180})

	# validates_presence_of(:title, :body)
	# validates_presence_of(:title, message: 'must be entered')
	# validates_presence_of(:body, message: 'must be entered')

	def admin_or_belongs_to?(user)
		user.try(:admin?) || self.user == user
	end

	def self.search(query)
		query = "%#{query}%"
		where("title LIKE ? OR body LIKE ?", query, query)
	end

  	has_attached_file(:image,
  						styles: {thumbnail: '100x100>',
  								  full: '300X300>'})
  	validates_attachment_content_type(:image, content_type: /\Aimage\/.*\z/)


end
