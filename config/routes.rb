Rails.application.routes.draw do
	root('tweets#index')
	devise_for(:users)
 	resources(:tweets)
 	resources(:users, only: :show)
end

				#  Prefix Verb   URI Pattern                    Controller#Action
#                     root GET    /                              tweets#index
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy


#                   tweets GET    /tweets(.:format)              tweets#index
#                          POST   /tweets(.:format)              tweets#create
#                new_tweet GET    /tweets/new(.:format)          tweets#new
#               edit_tweet GET    /tweets/:id/edit(.:format)     tweets#edit
#                    tweet GET    /tweets/:id(.:format)          tweets#show
#                          PATCH  /tweets/:id(.:format)          tweets#update
#                          PUT    /tweets/:id(.:format)          tweets#update
#                          DELETE /tweets/:id(.:format)          tweets#destroy