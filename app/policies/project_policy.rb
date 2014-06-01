class ProjectPolicy < ApplicationPolicy
  def authenticated?
    !user.nil?
  end

  def create?
    authenticated? && user.editor?
  end

  alias_method :update?, :create?
  alias_method :delete?, :create?

  def permitted_attributes
    [:name, :technologies_used, :image]
  end
end
