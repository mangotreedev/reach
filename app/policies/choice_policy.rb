class ChoicePolicy < ApplicationPolicy
  def create?
    record.survey.user == user
  end

  def destroy?
    record.survey.user == user
  end
end
