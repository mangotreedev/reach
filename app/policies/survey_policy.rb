class SurveyPolicy < ApplicationPolicy
  def create?
    user
  end

  def show?
    record.published?
  end
end
