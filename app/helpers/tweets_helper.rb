module TweetsHelper
# need argument to method "(tweet)" here so that show and index work, on show page use @(tweet) and on index use tweet bc its in a loop
	def edit_tweet_link(tweet)
		link_to('Edit', edit_tweet_path(tweet))
	end

	def delete_tweet_link(tweet)
		link_to('Delete', tweet, method: :delete, data: {confirm: 'Are you sure?'})
	end
end


