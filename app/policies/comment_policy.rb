class CommentPolicy < ApplicationPolicy
  
  def index?
    true
  end

  def new?
    user.present?
  end

  def create? 
    user.present?
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
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