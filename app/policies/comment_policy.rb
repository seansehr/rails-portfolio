class CommentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user && user.editor?
        scope.all
      else
        scope.where(approved: true)
      end

    end
  end

  def authenticated?
    !user.nil?
  end

  def create?
    authenticated?
  end

  def publish?
    authenticated? && user.editor?
  end

  alias_method :view?, :publish?
  alias_method :delete?, :publish?

  def permitted_attributes
    attrs = [:content]
    if user.editor?
      attrs << :approved
    end
    attrs
  end
end
