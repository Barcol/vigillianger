# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.guest?
      can :access, :shop_lists
    end

    if user.organizer?
      can :access, :shop_lists
      can :access, :melange_management
    end
  end
end
