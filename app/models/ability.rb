class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new
  
      can :read, Product  # Todos los usuarios pueden leer productos
  
      if user.persisted?
        can :manage, Product, user_id: user.id  # Solo el creador del producto puede editarlo y eliminarlo
      end
    end
  end
  