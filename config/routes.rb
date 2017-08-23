Rails.application.routes.draw do
  	devise_for :users
	root('tweets#index')
 	resources(:tweets)
end

# Prefix Verb   URI Pattern                Controller#Action
#       root GET    /                          tweets#index
#     tweets GET    /tweets(.:format)          tweets#index



#  new_tweet GET    /tweets/new(.:format)      tweets#new
#            POST   /tweets(.:format)          tweets#create


# edit_tweet GET    /tweets/:id/edit(.:format) tweets#edit
#      tweet GET    /tweets/:id(.:format)      tweets#show
#            PATCH  /tweets/:id(.:format)      tweets#update
#            PUT    /tweets/:id(.:format)      tweets#update
#            DELETE /tweets/:id(.:format)      tweets#destroy