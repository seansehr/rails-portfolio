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

  def permitted_attributes
    attrs = [:author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :context]
    if user.editor?
      attrs << :approved
    end
    attrs
  end
end
