module IsolatedEngine
  class EngineEventHandler

    # This class#method will be triggered upon the event_name :todo_update_successful
    def self.todo_update_successful(todo_id)
      todo = Todo.find_by_id(todo_id)
      Notification.create(todo_id: todo.id, description: "All done")
    end


    def self.todo_update_failed(todo_id)
      todo = Todo.find_by_id(todo_id)
      Notification.create(todo_id: todo.id, description: "Failed to update Todo item")
    end

  end
end