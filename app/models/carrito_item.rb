class CarritoItem < ApplicationRecord
  belongs_to :carrito
  belongs_to :product

  def subtotal
    product.price * quantity
  end
end
