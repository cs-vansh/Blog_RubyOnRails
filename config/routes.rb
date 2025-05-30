Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "blog_posts#index"

  # Define routes for blog posts instead of the following routes.
  resources :blog_posts
  # get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  # post "/blog_posts", to: "blog_posts#create", as: :blog_posts


  # # by using as: :blog_posts, even if we change the url we can always access the route by using:
  # # blog_post_path(123) -> "/blog_post/123"
  # # or
  # # blog_post_url(1) -> "https://localhost:3000/blog_post/123"
  # # even if we change this route to
  # # get "/blog/:id" ; it would work fine as we wont hardcode anywhere the path in ruby code, but use blog_post_path or blog_post_url
  # get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post

  # get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
  # # rails pack helpers basically generates the string but doesnt care about the request type, so I can still use blog_post_path &/or blog_past_url without specifying as:
  # # patch "/blog_posts/:id", to: "blog_posts#update", as: :blog_post
  # patch "/blog_posts/:id", to: "blog_posts#update"

  # delete "/blog_posts/:id", to: "blog_posts#destroy"

  # special route for signup,login and edit profile links, etc.
  devise_for :users
end
