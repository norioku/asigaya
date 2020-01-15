Rails.application.routes.draw do

	root "homes#index"

	devise_for :users, controllers: {
	sessions:      'users/sessions',
	passwords:     'users/passwords',
	registrations: 'users/registrations'
	}

	get "users/:id" => "users#show", as: "user"
	get "users/:id/favorite" => "users#favorite", as: "user_favorite"
	get "users/:id/edit" => "users#edit",as: "user_edit"
	patch "users/:id" => "users#update",as:"user_update"
	put "users/:id" => "users#update"
	get "users/:id/unsubscribe" => "users#unsubscribe",as: "user_unsubscribe"
	delete "users/:id/destroy" => "users#destroy",as: "destroy_user"
	get "users/exit" => "users#exit",as: "user_exit"
			
	get "admins/users" => "users#admin_index",as: "users"

	get "posts" => "posts#index", as: "posts"
	get "posts/favorite" => "posts#favorite", as:"posts_favorite"
	get "posts/new" => "posts#new",as: "post_new"
	get "posts/:id" => "posts#show",as:"post_show"
	get "posts/:id/edit" => "posts#edit",as:"post_edit"
	post "posts" => "posts#create",as:"post_create"
	patch "posts/:id" => "posts#update",as: "post_update"
	put "users/close" => "users#complete"
	delete "posts/:id" => "posts#destroy",as: "destroy_post"

	get "user/:id/inquiries/new" => "inquiries#new", as: "new_user_inquiry"
	post "user/:id/inquiries" => "inquiries#create", as: "user_inquiries"
	get "user/:id/inquiries/complete" => "inquiries#complete", as: "user_inquiries_complete"
	 
	get "admins/inquiries" => "inquiries#admin_index", as: "admin_inquiry_index"
	get "admins/inquiries/:id" => "inquiries#admin_show", as: "admin_inquiry_show"
	patch "admins/inquiries/:id" => "inquiries#update"
		
	get "location_informations" => "location_informations#index"
		
	get "users/:id/favorite" => "favorite#index", as: "favorite_index"
	post   '/favorite/:post_id' => 'favorites#favorite', as: 'favorite'
	delete '/favorite/:post_id' => 'favorites#unfavorite', as: 'unfavorite'
		
	get 'tags/:tag', to: 'posts#index', as: :tag
		
end
