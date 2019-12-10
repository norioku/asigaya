Rails.application.routes.draw do

#topページ
  root "homes#index"

#user devise
      devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
      
}

# users
      get "users/:id" => "users#show", as: "user"
      get "users/:id/edit" => "users#edit",as: "user_edit"
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
 	  get "posts" => "posts#index", as: "posts"
      get "posts/new" => "posts#new",as: "post_new"
      get "posts/:id" => "posts#show",as:"post_show"
      get "posts/:id/edit" => "posts#edit",as:"post_edit"
      post "posts" => "posts#create",as:"post_create"
      patch "posts/:id" => "posts#update",as: "post_update"
      put "users/close" => "users#complete"
      delete "posts/:id" => "posts#destroy",as: "destroy_post"


#inquiries
	  get "user/:id/inquiries/new" => "inquiries#new", as: "new_user_inquiry"
    post "user/:id/inquiries" => "inquiries#create", as: "user_inquiries"
	  get "user/:id/inquiries/complete" => "inquiries#complete", as: "user_inquiries_complete"
	  
#location_information
    get "location_informations" => "location_informations#index"
    
#favorite
    get "users/:id/favorite" => "favorite#index", as: "favorite"
    
#tag
    get 'tags/:tag', to: 'posts#index', as: :tag

end
