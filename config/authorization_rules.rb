authorization do
  role :guest do
    has_permission_on :conferences, :to => :read do
      if_attribute :published => true
    end
    has_permission_on :talks, :to => :read do
      if_permitted_to :read, :conference
    end
    has_permission_on :users, :to => :create
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
  end
  
  role :user do
    includes :guest
    has_permission_on :conference_attendees, :to => :create, :join_by => :and do
      if_attribute :user => is {user}
      if_permitted_to :read, :conference
    end
    has_permission_on :conference_attendees, :to => :delete do
      if_attribute :user => is {user}
    end
    has_permission_on :talk_attendees, :to => :create do
      if_attribute :talk => { :conference => { :attendees => contains {user} }},
          :user => is {user}
    end
    has_permission_on :talk_attendees, :to => :delete do
      if_attribute :user => is {user}
    end
    has_permission_on :addresses, :to => :manage do
      if_attribute :conferences => { :attendees => contains {user} }
    end
  end
  
  role :conference_organizer do
    has_permission_on :conferences do
      to :manage
      # if...
    end
    has_permission_on [:conference_attendees, :talks, :talk_attendees, :addresses], :to => :manage
  end
  
  role :admin do
    has_permission_on [:conferences, :users, :talks], :to => :manage
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
    has_permission_on :addresses, :to => :manage
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end