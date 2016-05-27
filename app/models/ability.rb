class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :create, Comment, :user_id => user.id
      can :manage, User, id: user.id
      cannot :destroy, Comment
      can :manage, Product
      cannot [:create, :update, :destroy], Product
    end
  end
end
