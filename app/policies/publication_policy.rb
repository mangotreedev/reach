class PublicationPolicy < ApplicationPolicy
  def create?
    record.user == user
  end
end
