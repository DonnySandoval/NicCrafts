class ProductConversationsController < ApplicationController
    before_action :authenticate_user!
  

    def new
      @product = Product.find(params[:product_id])
      recipient = @product.user
      message_body = "Me interesa tu producto: #{@product}"
      context = nil
      @conversation = current_user.send_message(recipient, message_body, context)
    end
    
    
    
  
    def create
      @product = Product.find(params[:product_id])
      
      if params[:conversation] && params[:conversation][:body].present?
        @conversation = current_user.send_message(@product.user, params[:conversation][:body], nil)
    
        if @conversation.valid?
          flash[:notice] = "Mensaje enviado correctamente."
          
        else
          flash[:error] = "Hubo un error al enviar el mensaje."
          render :new
        end
      else
        flash[:error] = "El cuerpo del mensaje no puede estar en blanco."
        render :new
      end
    end
    
  end
  