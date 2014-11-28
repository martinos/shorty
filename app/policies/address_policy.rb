class AddressPolicy < ApplicationPolicy
  def update?
    user.id  == record.user_id
  end

  def create?
    user.id  == record.user_id
  end

  def destroy?
    user.id  == record.user_id
  end
end
