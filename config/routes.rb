# routes.rb

Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/create'
  get 'orders/show'
 # config/routes.rb

resources :products  # Rutas de productos
get 'tienda/index'   # Ruta para la tienda
get 'tienda/verpro'

get '/products/:id', to: 'products#show', as: 'product_ver'

devise_for :users, controllers: { registrations: 'registrations' }    # Rutas de autenticación (por ejemplo, registro, inicio de sesión, etc.)

root 'welcome#index'  # Ruta raíz
# resources :products do
#   member do
#     post 'start_conversation'
#   end
# end






# Ruta para el carrito
resources :orders



# Ruta para agregar un producto al carrito
post '/carrito/agregar_producto/:product_id', to: 'carrito#agregar_producto', as: 'carrito_add_product'

# Otras rutas personalizadas si las tienes
delete 'carrito/eliminar_producto/:id', to: 'carrito#eliminar_producto', as: 'eliminar_producto'

  
get '/carrito', to: 'carrito#index', as: 'carrito'


  # Otras rutas personalizadas si las tienes

end
