# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(customer)
    # Define abilities for the passed in customer here. For example:
    #
    customer ||= Customer.new # guest customer (not logged in)
    can :manage, :all

    if customer.superadmin_role?
      can :manage, :all
      can :access, :rails_admin       # only allow admin customers to access Rails Admin
      can :manage, :dashboard           # allow access to dashboard
    end

    if customer.supervisor_role?
      can :manage, Customer
    end
    #
    # The first argument to `can` is the action you are giving the customer
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the customer can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the customer can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
