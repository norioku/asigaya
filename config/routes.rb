Rails.application.routes.draw do

#topページ
  root "homes#index"

#user devise
      devise_for :users
# users
      get "users/:id" => "users#show", as: "user"
      get "users/:id/edit" => "users#edit",as: "users_edit"
      patch "users/:id" => "users#update",as:"user_update"
      put "users/:id" => "users#update"
      get "users/:id/close" => "users#close",as: "user_close"
      delete "users/:id/destroy" => "users#destroy",as: "destroy_user"
      get "users/close" => "users#complete"


#user devise_def
  #get 'users/index'
  #get 'users/show'
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#post
 	 resources :posts


#inquiries
	  get "user/:id/inquiries/new" => "inquiries#new", as: "new_user_inquiry"
    post "user/:id/inquiries" => "inquiries#create", as: "user_inquiries"
	  get "user/:id/inquiries/complete" => "inquiries#complete", as: "user_inquiries_complete"
	  
#location_information
    get "location_informations" => "location_informations#index"

end
