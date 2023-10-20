
class OrdersController < ApplicationController
  # ...

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      # Realizar el procesamiento del pago si es necesario
      redirect_to @order, notice: 'Pedido realizado con éxito.'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address, :other_attributes)
  end

  # ...
end
