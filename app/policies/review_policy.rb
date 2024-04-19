# app/policies/review_policy.rb
class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_a?(Admin)
        scope.all
      elsif user.is_a?(Student)
        scope.where(user_id: user.id)
      else
        scope.none
      end
    end
  end

  def index?
    user.is_a?(Professional) || user.is_a?(Admin)
  end

  def show?
    user.is_a?(Professional) || user.is_a?(Admin)
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user.is_a?(Professional) || user.is_a?(Admin)
  end

  def edit?
    update?
  end

  def destroy?
    user.is_a?(Admin)
  end

  def validate?
    user.is_a?(Professional) || user.is_a?(Admin)
  end
end
