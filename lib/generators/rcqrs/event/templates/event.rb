class <%= class_name %>Event < Events::DomainEvent
  initializer :guid, :attr_reader => true
end