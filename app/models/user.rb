class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
         has_many :cart_items, class_name: 'CarritoItem', foreign_key: 'carrito_id'
         has_many :products
         has_one :carrito
         has_many :orders
         attr_accessor :address
         acts_as_messageable
         def cart
          cart_items
        end

end
