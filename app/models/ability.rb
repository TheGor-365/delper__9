# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(account)
    # Define abilities for the passed in account here. For example:
    #
    account ||= Account.new # guest account (not logged in)
    can :manage, :all

    if account.superadmin_role?
      can :manage, :all
      can :access, :rails_admin       # only allow admin accounts to access Rails Admin
      can :manage, :dashboard           # allow access to dashboard
    end

    if account.supervisor_role?
      can :manage, Account
    end
    #
    # The first argument to `can` is the action you are giving the account
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the account can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the account can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
