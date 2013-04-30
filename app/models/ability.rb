class Ability
  include CanCan::Ability

  
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is?('super')
      can :manage, :all
    elsif user.is?('admin')
      can :manage, [Blog, Menu, Boxmenu, Gallery, Order]
      can [:read, :create, :update], Punchclock, :user_id => user.id
    elsif user.is?('employee')
      can [:read, :show, :index, :create, :update], Punchclock, :user_id => user.id
      can :show, [Boxmenu, Menu, Gallery, Blog]
      can :get_menu, Menu
    else
      can :get_box_menu, Boxmenu
      can :get_menu, Menu
      can :show, [Menu, Boxmenu, Gallery, Blog]
      can :show, Order, :user_id => user.id
      can :create, Order
      can :confirmation, Order
      can :update, Order do |order|
        order.try(:user)==user
      end
    end
   end


end
