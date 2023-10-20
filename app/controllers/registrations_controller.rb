class RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        if resource.persisted?
          Carrito.create(user: resource) # Crea un carrito asociado al usuario
        end
      end
    end
  end
  