class CarritoController < ApplicationController
  before_action :authenticate_user!
  before_action :load_carrito
  def index
    @carrito = current_user.carrito
    @productos_en_carrito = @carrito.carrito_items.map(&:product)
  end
  def show
    @carrito = current_user.carrito
  end

  def agregar_producto
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i 
  
    if current_user.carrito.nil?
      current_user.create_carrito # Crea un nuevo carrito si no existe
    end
  
    current_user.carrito.add_product(product, quantity)
    redirect_to carrito_path, notice: 'Producto agregado al carrito.'
  end
  
  
   def mostrar_total
    @carrito = current_user.carrito
    @total = @carrito.total
  end

  def eliminar_producto
    product_id = params[:id]
    current_user.carrito.carrito_items.find_by(product_id: product_id).destroy
    render json: { success: true }
  end
  
  private

  def load_carrito
    @carrito = current_user.carrito
  end
end
