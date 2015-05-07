class CommentPolicy < ApplicationPolicy
  
  def index?
    true
  end

  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(:user_id => user.id)
      end
    end
  end

end