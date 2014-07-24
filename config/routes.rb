Wallbase::Application.routes.draw do
  resources :opening_pages

  # Main resources
  resources :collections
  resources :collection_sections
  resources :style_types, :path => "style-types"
  resources :profiles
  resources :colors
  resources :color_palettes, :path => "color-palettes"

  # Johnsonite API routes
  match '/samplecart' => 'filters#samplecart', as: 'sample_cart', via: [:get, :post]

  # Root path
  root :to => 'filters#index'
  post '/' => 'filters#index'
  get '/color-pallete-chart' => 'filters#color_palettes', as: 'color_palette_chart'
end
