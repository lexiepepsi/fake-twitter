class TweetsController < ApplicationController
	# before_action(:authenticate_user!, only: [:new, :create, :edit, :update, :destroy])
	# same below but easier
	before_action(:authenticate_user!, except: [:index, :show])
# use before action to do something before these specific actions

	before_action(:find_tweet, only: [:show, :edit, :update, :destroy])
	before_action(:redirect_to_homepage_unless_tweet_belongs_to_current_user, only: [:edit, :update])

	def index
		@tweets = Tweet.search(params[:query])
	end

	def new
		@tweet = Tweet.new
	end

	def create
		# @tweet = Tweet.create(tweet_params) #where the tweet literally gets created

		# @tweet = Tweet.new(tweet_params)
		# @tweet.user = current_user
		# @tweet.save

		@tweet = current_user.tweets.create(tweet_params)

		if @tweet.valid?
			redirect_to_tweet('Your tweet was sucessfully created!')
			# redirect_to(@tweet, notice: 'Your tweet was sucessfully created!') # flash notice
		else
			render(:new)
			# instead of rendering create, render new view instead
		end
	end

	#make sure the not logged in user cannot get to edit page of a tweet is not theirs
	# def edit 
	# 	unless @tweet.user == current_user
	# 		redirect_to(root_path, notice: "That's not your tweet")
	# 	end
	# end


	def update
		@tweet.update(tweet_params)

		if @tweet.valid?
			redirect_to_tweet('Your tweet was sucessfully updated!')
		else
			render(:edit)
		end
	end

	def destroy
		@tweet.destroy
		redirect_to(tweets_path, notice: 'Your tweet was sucessfully deleted!')
	end

# private to the class, not public (outside the class), not an action
	private

# helper method to reduce duplication
	def find_tweet
		@tweet = Tweet.find(params[:id])
	end

	def tweet_params
		params[:tweet].permit(:title, :body, :user_id, :image)
	end

	def redirect_to_tweet(message)
		redirect_to(@tweet, notice: message)
	end

	def redirect_to_homepage_unless_tweet_belongs_to_current_user
		unless @tweet.admin_or_belongs_to?(current_user)
			redirect_to(root_path, notice: 'That is not your tweet!')
		end
	end

end
