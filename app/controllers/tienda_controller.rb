class TiendaController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    if params[:category].present?
      @categoria_seleccionada = params[:category]
      @products = Product.where(category: @categoria_seleccionada)
    else
      @products = Product.all
    end
  end
end
