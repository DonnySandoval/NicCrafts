class Order < ApplicationRecord
  belongs_to :user
  attr_accessor :shipping_address
end
