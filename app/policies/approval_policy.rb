class ApprovalPolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
