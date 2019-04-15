module InventoryEngine
  class UpdateTodo
    include Wisper::Publisher

    def mark_as_done(todo_id)
      todo = Todo.find_by_id(todo_id)

      if todo.update(completed: true)
        # Call the event published to broadcast a message with the event_name and event_params
        InventoryEngine::EngineEventPublisher.new.call(:todo_update_successful, todo.id)
      else
        InventoryEngine::EngineEventPublisher.new.call(:todo_update_failed, todo.id)
      end

    end

  end
end
