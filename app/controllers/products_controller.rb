class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /products or /products.json
  def index
    # @products = Product.all
    @product = Product.new # Inicializa un nuevo objeto product´
    @products = current_user.products
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
    render :template => 'tienda/show'
  end
  

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    #@product = Product.new(product_params)
    @product = current_user.products.build(product_params)
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.carrito_items.destroy_all


    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # app/controllers/productos_controller.rb
  def comprar
    @product = Product.find(params[:id])
    @carrito_item = CarritoItem.new(product: @product)
  end
  
  def agregar_al_carrito
    @product = Product.find(params[:id])
    quantity = params[:product][:quantity].to_i
    
    if user_signed_in? && current_user.carrito
      current_user.carrito.add_product(@product, quantity)
      redirect_to carrito_path, notice: 'Producto agregado al carrito.'
    else
      redirect_to new_user_session_path, alert: 'Inicia sesión para agregar productos al carrito.'
    end
  end

  def start_conversation
    product = Product.find(params[:id])
    recipient = product.user  # El vendedor del producto
  
    # Crear una nueva conversación y redirigir al chat
    conversation = current_user.send_message(recipient, "¡Hola! Estoy interesado en tu producto.", "Asunto del mensaje")
  
    redirect_to conversation
  end
  
  
  

  private
   
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :category, :image)
    end
end
