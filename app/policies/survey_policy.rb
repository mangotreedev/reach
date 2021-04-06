class SurveyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.published.approved
    end
  end

  def create?
    user
  end

  def show?
    record.published?
  end
end
