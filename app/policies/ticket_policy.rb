class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.cs_rep?
        scope.where("author_id = ? or assignee_id = ?", user.id, user.id)
      else
        scope.all
      end
    end
  end

  def create?
    user.cs_rep?
  end

  def update?
    if user.cs_rep?
      #if a ticket's author or assignee is the user
      user.id == record.author_id || user.id == assignee_id
    else
      return true
    end
  end

  def destroy?
    user.manager?
  end

  def close_ticket?
    user.manager?
  end

  def assign?
    user.manager?
  end

end
