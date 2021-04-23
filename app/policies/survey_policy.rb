class SurveyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.published.approved.includes([photo_attachment: :blob])
    end
  end

  def create?
    user
  end

  def show?
    record.published? || record.
  end

  def destroy?
    record.user == user || user.admin?
  end
end
