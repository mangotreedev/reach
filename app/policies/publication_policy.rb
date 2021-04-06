class PublicationPolicy < ApplicationPolicy
  def create?
    record.user == user
  end

  def destroy?
    create?
  end
end
