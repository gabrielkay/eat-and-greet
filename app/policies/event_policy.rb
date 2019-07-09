class EventPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def update?
    user.id == event.creator_id
  end

  def edit?
    update?
  end

  def destroy?
    user.id == event.creator_id
  end
end
