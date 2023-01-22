Rails.application.routes.draw do
  root "articles#index"

  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show" # ArticlesController can now access the id value provided via `params[:id]`

end
