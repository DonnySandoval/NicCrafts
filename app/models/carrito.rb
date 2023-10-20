# class Carrito < ApplicationRecord
#   belongs_to :user
#   has_many :carrito_items
#   has_many :products, through: :carrito_items
# end
# carrito.rb

class Carrito < ApplicationRecord
  belongs_to :user
  has_many :carrito_items
  has_many :productos, through: :carrito_items

  def add_product(producto, quantity)
    carrito_items.create(product: producto, quantity: quantity)
  end
  

  def total
    carrito_items.sum { |item| item.product.price * item.quantity }
  end

  def total_quantity
    carrito_items.sum(:quantity)
  end
    
end
