Rails.application.config.to_prepare do
  Wisper.clear if Rails.env.development?

  # # Subscriber for the Isolated Engine
  # # This one will subscribe to all messages (events) that get published, regardless of the source
  # # Of course, the EngineEventHandler will dictate what should be done, if anything
  Wisper.subscribe(IsolatedEngine::EngineEventHandler)

  # # Subscriber for the Other Isolated Engine
  # # This one will only subscribe to messages published be the specified (scoped) publishers
  Wisper.subscribe(OtherIsolatedEngine::EngineEventHandler, scope: ["InventoryEngine::EngineEventPublisher"])

  # # Subscriber for the Other Isolated Engine
  # # This one will only subscribe to messages published be the specified (scoped) publishers
  # # AND it will also only listen for the specified event_name
  Wisper.subscribe(OtherIsolatedEngine::EngineEventHandler, scope: ["InventoryEngine::EngineEventPublisher"], on: :todo_update_successful)

  # Subscriber for the Other Isolated Engine
  # This one will only subscribe to messages published be the specified (scoped) publishers
  # AND handle requests asynchronously...
  # Wisper has various adapters for asynchronous event handling, please refer to wisper-celluloid,
  # wisper-sidekiq, wisper-activejob, wisper-que or wisper-resque
  # Wisper.subscribe(OtherIsolatedEngine::EngineEventHandler, scope: ["InventoryEngine::EngineEventPublisher"],  async: true)

end