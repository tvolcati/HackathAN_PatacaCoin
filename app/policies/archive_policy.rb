# app/policies/archive_policy.rb
class ArchivePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.is_a?(Admin)
  end

  def new?
    create?
  end

  def update?
    user.is_a?(Admin)
  end

  def review?
    user.is_a?(Admin) || user.is_a?(Professional)
  end

  def edit?
    update?
  end

  def destroy?
    user.is_a?(Admin)
  end
end
