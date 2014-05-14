class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve

      if user && user.editor?
        scope.all
      elsif user && user.author?
        scope.where(author: user)
      else
        scope.where(published: true)
      end

    end
  end

  def authenticated?
    !user.nil?
  end

  def create?
    authenticated? && (user.editor? || user.author?)
  end

  def publish?
    authenticated? && user.editor?
  end

  def permitted_attributes
    if user.editor?
      [:title, :body, :published]
    else
      [:title, :body]
    end
  end
end
