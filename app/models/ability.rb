class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    return unless user.present? # additional permissions for logged in users (they can manage their posts)

    can :manage, Group, user_id: user.id
    can :manage, Payment, user_id: user.id
  end
end
