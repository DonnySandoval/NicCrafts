class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :carrito_items, dependent: :destroy
    belongs_to :user
    has_one :product_conversation
end
