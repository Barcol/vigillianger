# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    return unless user.present?

    if user.guest?
      can :access, :shop_lists
      can :read, Type, consume_preferences: {type: {id: user.party_guest.type_ids}}
    end

    if user.organizer?
      can :crud, Type
      can :access, :shop_lists
      can :access, :melange_management
    end
  end
end
